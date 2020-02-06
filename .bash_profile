# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH="$HOME/.anyenv/bin:$PATH"

# docker shortcuts
alias ds='/home/ec2-user/bin/dockerd-rootless.sh --experimental --storage-driver vfs &'
alias d='docker'
alias dc='docker-compose'
alias dimg='docker image ls'
alias dps='docker container ls'
alias dpsa='docker container ls -a'
alias dcur='docker container ls -f status=running -l -q'
alias dexec='docker container exec -it $(dcur)'
alias drun='docker container run --rm -d'
alias drunit='docker container run --rm -it'
alias dstop='docker container stop $(dcur)'
alias dprune='docker system prune -a'

alias k='kubectl'
alias kg='kubectl get '
alias kd='kubectl describe '
alias kgn='kubectl get node -o wide'
alias kgp='kubectl get pod -o wide'
alias kgs='kubectl get service -o wide'
alias kapp='kubectl apply -f '
alias kdel='kubectl delete '
alias kdelf='kubectl delete -f '
alias kk='kubectl kustomize'
alias ke='kubectl exec -it'
alias kgs='kubectl get services'

alias kc='kubectx'
alias kn='kubens'

# prompt
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}
function promps {
    local  BLUE="\[\e[1;34m\]"
    local  RED="\[\e[1;31m\]"
    local  GREEN="\[\e[1;32m\]"
    local  WHITE="\[\e[00m\]"
    local  GRAY="\[\e[1;37m\]"

    case $TERM in
        xterm*) TITLEBAR='\[\e]0;\W\007\]';;
        *)      TITLEBAR="";;
    esac
    local BASE="\u@\h"
    PS1="${TITLEBAR}${GREEN}${BASE}${WHITE}:${BLUE}\W${GREEN}\$(parse_git_branch)${BLUE}\$${WHITE} "
}
promps

# dienv
export EDITOR=vim
eval "$(direnv hook bash)"

# anyenv
eval "$(anyenv init -)"
export VIRTUAL_ENV_DISABLE_PROMPT=1
