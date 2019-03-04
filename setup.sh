#!/bin/bash
sudo apt install curl
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo add-apt-repository ppa:kelleyk/emacs

sudo apt update
sudo apt upgrade

sudo apt install git tig tilix xclip feh pgcli mycli ranger zsh tmux tree \
     translate-shell gnustep-gui-runtime mps-youtube rofi i3 i3lock-fancy \
     apt-transport-https ca-certificates gnupg-agent containerd.io \
     software-properties-common fzy inotify-tools jq automake emacs26 autoconf \
     libreadline-dev libncurses-dev libssl-dev libyaml-dev libxslt-dev \
     libffi-dev libtool unixodbc-dev docker-ce docker-ce-cli \
     python-pygments pandoc

sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh

git clone --bare https://github.com/joao/dotfiles.git $HOME/.dotfiles
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

curl -l \
     https://gist.githubusercontent.com/lucasdavila/3875946/raw/\
1c100cae16a06bef154af0f290d665405b554b3b/install_source_code_pro.sh | sudo sh
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mix do escript.install hex ex_doc, local.hex
mix archive.install hex phx_new 1.4.1

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

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get install -f

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

rm -rf openfortigui_0.7.2-3_bionic_amd64.deb \
   dialyxir bunt credo SourceCodePro_FontsOnly-1.010.zip \
   SourceCodePro_FontsOnly-1.010 google-chrome-stable_current_amd64.deb

snap install postman
snap install ripgrep
sudo snap install kubectl --classic
sudo snap install slack --classic

git clone https://github.com/asdf-vm/asdf.git ~/.asdf
asdf plugin-add kubectx https://github.com/virtualstaticvoid/asdf-kubectx.git
asdf plugin-add python https://github.com/danhper/asdf-python.git
asdf plugin-add elixir
asdf plugin-add nodejs 
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

sh -c \
   "$(wget https://raw.githubusercontent.com/robbyrussell/\
oh-my-zsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)

ssh-keygen
xclip -sel clip < ~/.ssh/id_rsa.pub
firefox https://github.com/settings/ssh/new
