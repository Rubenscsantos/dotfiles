#!/bin/bash
sudo apt install curl
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
    sudo dpkg -i erlang-solutions_1.0_all.deb

sudo add-apt-repository ppa:kelleyk/emacs

sudo apt update
sudo apt upgrade

sudo apt install git tig tilix xclip feh pgcli mycli ranger zsh tmux tree \
     translate-shell gnustep-gui-runtime mps-youtube rofi i3 i3lock-fancy \
     nodejs apt-transport-https ca-certificates gnupg-agent containerd.io \
     software-properties-common fzy inotify-tools jq automake emacs26 autoconf \
     libreadline-dev libncurses-dev libssl-dev libyaml-dev libxslt-dev \
     libffi-dev libtool unixodbc-dev esl-erlang elixir docker-ce docker-ce-cli \
     python-pygments

git clone --bare https://github.com/joao/dotfiles.git $HOME/.dotfiles
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

curl -l \
     https://gist.githubusercontent.com/lucasdavila/3875946/raw/\
     1c100cae16a06bef154af0f290d665405b554b3b/install_source_code_pro.sh \
    | sudo sh
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

mix do escript.install hex ex_doc, local.hex
mix archive.install hex phx_new 1.4.1

git clone https://github.com/jeremyjh/dialyxir.git
cd dialyxir
mix do deps.get, archive.build, archive.install
cd -

git clone https://github.com/rrrene/bunt.git
cd bunt
mix do archive.build, archive.install
cd -
git clone https://github.com/rrrene/credo.git
cd credo
mix do deps.get, archive.build, archive.install
cd -

sudo usermod -aG docker $USER
sudo curl -L \
     "https://github.com/docker/compose/releases/download/1.23.2/\
docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

wget \
    https://apt.iteas.at/iteas/pool/main/o/openfortigui/\
openfortigui_0.7.2-3_bionic_amd64.deb
sudo dpkg -i openfortigui_0.7.2-3_bionic_amd64.deb
sudo apt-get install -f

curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

rm -rf erlang-solutions_1.0_all.deb openfortigui_0.7.2-3_bionic_amd64.deb \
   dialyxir bunt credo SourceCodePro_FontsOnly-1.010.zip \
   SourceCodePro_FontsOnly-1.010

snap install postman
sudo snap install kubectl --classic
sudo snap install slack --classic

git clone https://github.com/asdf-vm/asdf.git ~/.asdf

sh -c \
   "$(wget https://raw.githubusercontent.com/robbyrussell/\
oh-my-zsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)

ssh-keygen
xclip -sel clip < ~/.ssh/id_rsa.pub
firefox https://github.com/settings/ssh/new
