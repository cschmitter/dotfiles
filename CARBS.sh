#!/usr/bin/env bash
set -euo pipefail

# set up dotfiles
cd ~
mkdir -p Downloads
mkdir -p Documents
mkdir -p Pictures
mkdir -p code

cp -n -l ~/dotfiles/* $HOME

# install software with xbps-install
sudo xbps-install network-manager sway wsget ripgrep firefox thunderbird gufw mosh zsh kitty tmux vim emacs texlive-full stack

# install Nerd Fonts
cd ~/Downloads
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
./install.sh "JetBrains Mono"

# set up Tailscale VPN

# install zoom client

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



