#!/usr/bin/env bash
set -euo pipefail

# install software with apt
sudo apt update
sudo apt purge -y gnome
sudo apt install -y gnome-core
sudo apt upgrade -y

sudo apt install -y wget ripgrep firefox thunderbird gufw openssh-client topenssh-server mosh zsh kitty gvim emacs-nox texlive haskell-stack

# set up dotfiles
cd $HOME
mkdir Downloads
mkdir Documents
mkdir Pictures

cp -n -l $HOME/dotfiles/* $HOME

# install Nerd Fonts
cd Downloads
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
./install.sh "JetBrains Mono"

# set up Tailscale VPN
curl -fsSL https://pkgs.tailscale.com/stable/debian/buster.gpg | sudo apt-key add -
curl -fsSL https://pkgs.tailscale.com/stable/debian/buster.list | sudo tee /etc/apt/sources.list.d/tailscale.list

sudo apt-get update
sudo apt-get install -y tailscale
sudo tailscale up
