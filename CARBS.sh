#!/usr/bin/env bash
set -euo pipefail

# install software with apt
sudo apt update
sudo apt upgrade -y
sudo apt install -y gnome-core
sudo apt install -y wget ripgrep firefox thunderbird gufw mosh zsh kitty tmux gvim emacs-nox texlive haskell-stack firmware-nonfree

# set up dotfiles
cd $HOME
mkdir Downloads
mkdir Documents
mkdir Pictures

cp -n -l $HOME/dotfiles/* $HOME

# install Nerd Fonts
cd $HOME/Downloads
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
./install.sh "JetBrains Mono"

# set up Tailscale VPN
curl -fsSL https://pkgs.tailscale.com/stable/debian/buster.gpg | sudo apt-key add -
curl -fsSL https://pkgs.tailscale.com/stable/debian/buster.list | sudo tee /etc/apt/sources.list.d/tailscale.list

sudo apt-get update
sudo apt-get install -y tailscale
sudo tailscale up

# install zoom client
cd $HOME/Downloas
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install ./zoom_amd64.deb

# install oh-my-zsh
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install typewritten
git clone https://github.com/reobin/typewritten.git $ZSH_CUSTOM/themes/typewritten
ln -s "$ZSH_CUSTOM/themes/typewritten/typewritten.zsh-theme" "$ZSH_CUSTOM/themes/typewritten.zsh-theme"
ln -s "$ZSH_CUSTOM/themes/typewritten/async.zsh" "$ZSH_CUSTOM/themes/async"

# install doom emacs
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
doom sync

# install anaconda
cd ~/Downloads
wget https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh
./Anaconda3-2020.11-Linux-x86_64.sh



