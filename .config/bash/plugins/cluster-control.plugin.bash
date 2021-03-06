cite about-plugin
about-plugin 'buvis cluster management'

# get cpu temperature of all nodes in the cluster
function buvis-get-temp () {
    cd $HOME/.playbooks
    ansible-playbook get-cluster-temperature.yaml
    cd -
}

# reboot a node
function buvis-reboot () {
    cd $HOME/git/src/gitlab.com/buvis/playbooks
    ansible -b -m reboot $1
    cd -
}

# shutdown a node
function buvis-shutdown () {
    cd $HOME/.playbooks
    ansible -b -m shell -a "shutdown now" $1
    cd -
}

# force deletion of namespace without resources
function buvis-delete-namespace () {
    NAMESPACE=$1
    kubectl get namespace $NAMESPACE 2>&1 1>/dev/null
    if [ $? -eq 0 ]; then
        resources=`kubectl get all -n $NAMESPACE 2>&1 | head -n 1`
        if [[ $resources = "No resources found in $NAMESPACE namespace." ]]; then
            kubectl get namespace $NAMESPACE -o json > $NAMESPACE.json
            sed -i -e 's/"kubernetes"//' $NAMESPACE.json
            kubectl replace --raw "/api/v1/namespaces/$NAMESPACE/finalize" -f ./$NAMESPACE.json
            rm $NAMESPACE.json
        else
            echo "There are still resources in $NAMESPACE namespace. Remove them first."
        fi
    fi
}
