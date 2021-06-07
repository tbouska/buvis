cite about-plugin
about-plugin 'mopidy players management'

export BUVIS_AWS_ACCOUNT=473900256917
export BUVIS_AWS_REGION=eu-west-1
export BUVIS_AWS_ECR=${BUVIS_AWS_ACCOUNT}.dkr.ecr.${BUVIS_AWS_REGION}.amazonaws.com
export BUVIS_MOPIDY_IMAGE=${BUVIS_AWS_ECR}/mopidy
export BUVIS_MOPIDY_PLATFORM=linux/arm/v6

# build mopidy image to buvis AWS ECR
function build-mopidy () {
    aws ecr get-login-password --region ${BUVIS_AWS_REGION} | docker login --username AWS --password-stdin ${BUVIS_AWS_ECR}
    docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
    docker buildx build --no-cache --platform ${BUVIS_MOPIDY_PLATFORM} -t ${BUVIS_MOPIDY_IMAGE} ~/.dockerfiles/mopidy
    docker push ${BUVIS_MOPIDY_IMAGE}
}

# print container log from remote machine
function print-mopidy-log () {
    ssh $1 'docker logs $(docker ps -f name=mopidy | cut -d " " -f1 | tail -n 1)'
}

# update image at remote machine
function update-mopidy () {
    case $1 in
        # hall is managed by kubernetes
        hall)
            kubectl rollout restart deployment mopidy-hall -n mopidy
            ;;
            # other players aren't part of cluster (for now)
        *)
            # Archive current image
            ssh $1 "docker stop mopidy;\
            docker stop mopidy-prev;\
            docker rm -v mopidy-prev;\
            docker rename mopidy mopidy-prev"

            # Run with new image
            ssh $1 "\$(aws ecr get-login --no-include-email --region ${BUVIS_AWS_REGION}) && \
            docker pull ${BUVIS_MOPIDY_IMAGE} && \
            docker run --detach --restart=always \
            -p 6680:6680 -p 6600:6600 \
            --device /dev/snd \
            --mount type=bind,source=/var/local/docker/mopidy/media,target=/var/lib/mopidy/media,readonly \
            --mount type=bind,source=/var/local/docker/mopidy/local,target=/var/lib/mopidy/local \
            --mount type=bind,source=/var/local/docker/mopidy/playlists,target=/var/lib/mopidy/playlists \
            --name mopidy ${BUVIS_MOPIDY_IMAGE}"
            ;;
    esac
}