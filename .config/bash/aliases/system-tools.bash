if [[ $(command -v bat) ]]; then alias cat="bat --paging never"; fi

alias ls="ls --color"
alias l="ls -l"
alias la="ls -a"
alias ll="ls -la"
alias lt="ls -lrt"

if [[ $(command -v most) ]]; then export PAGER="most"; fi

alias ssh="TERM=xterm-256color ssh"

if [[ $(command -v vim) ]]; then alias vi="vim"; fi

if [[ $(command -v vifm) ]]; then alias vifm='vifm ~/Downloads "$(pwd)"'; fi
