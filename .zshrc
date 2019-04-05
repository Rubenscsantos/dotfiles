alias cat='pygmentize -g'
alias p="postman"
alias tm="tmux new -s"
alias ra="ranger"
alias cop="xclip -sel clip <"
alias e="&&"
alias cu="curl"
alias sud="sudo"
alias t="trans en:pt -b"
alias pt="trans pt:en -b"
alias i="feh"
alias fe="firefox"
alias z="source ~/.zshrc"
alias co="mix coveralls.html && firefox cover/excoveralls.html"
alias de="date"
alias c="cal -y"
alias f="find -name"
alias code-insiders="code-insiders ."
# Network manager
alias n="nmtui"
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias m="mix"

alias kc='docker kill $(docker ps -q) && docker rm kafka zookeeper'
alias ds='docker ps'

alias gl=gloga
alias gp="git pull"
alias gpf="git push -f"
alias gpfn="git push -f --no-verify"
alias gbd="git branch -D"
alias gck="git checkout"
alias gckc="git checkout -b"
alias gpr="git pull --rebase"
alias grl="git rebase -"
alias gcm="git checkout master && git pull --rebase"
alias gr="git reset HEAD~1"
alias gc="git checkout"
alias gre="git rebase -"
alias gs="git status"

alias ku='kubectx "$(kubectx | fzy)"'
alias k='kubens "$(kubens | fzy)"'
alias ge="kubectl get endpoints"

export KUBECONFIG=~/k8s/hml-inside
export ZSH="/home/rubens/.oh-my-zsh"
export TERM="xterm-256color"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

ZSH_THEME=crunch
plugins=(
        git 
        kubectl 
        zsh-syntax-highlighting
        zsh-autosuggestions
        )
        
source $ZSH/oh-my-zsh.sh

function remote_console {
 if [ "$2" = "" ]
 then
   command=`echo $1 | tr - _`
 else
   command=$2
 fi 
 
 pod=`kubectl -n $1 get pods --no-headers  -o=jsonpath='{.items[0].metadata.name}'`
 
 kubectl -n $1 exec -it $pod /bin/bash -c $1 ./bin/$command remote_console
}

function remote_console_no_destillery {
   $(kubectl -n $1 get pod -o=jsonpath='{"kubectl -n '$1' exec -it "}{.items[0].metadata.name}{" -c '$1' -- /bin/bash"}') 
}

function get_envs {
  pod=`kubectl -n $1 get pods --no-headers  -o=jsonpath='{.items[0].metadata.name}'`
  kubectl -n $1 exec -it $pod -c $1 env
}


function port_forward {
  kubectl -n $1 port-forward deployment/$1 5432:5432
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
