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

# Youtube CLI
alias my="mpsyt"

export KUBECONFIG=$HOME/k8s/kub-config-inside-hml
export ZSH="/home/joao/.oh-my-zsh"
export EDITOR=code
export VISUAL=code
export TERM="xterm-256color"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

ZSH_THEME=crunch
plugins=(git kubectl web-search)
source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/joao/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/joao/Downloads/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/home/joao/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/joao/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

alias kubeip=$'kubectl describe service | grep Endpoint | grep -v none | awk \'{ print $2 }\''
alias kubepod=$'kubectl get pod --no-headers | awk \'NR==1{print $1}\''
kubenv() { kubectl exec -it $(kubepod) -c $1 printenv }
kubexec() { kubectl exec -it $(kubepod) -c $1 /bin/bash }
kubeforward() { kubectl port-forward deploy/$1 5432:5432 }

alias u="kubectl describe service | grep Endpoint | grep -v none | awk '{ print $2 }'| xclip -selection c"

# kubectl config
export KUBECONFIG=/home/joao/.kube/stone

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
