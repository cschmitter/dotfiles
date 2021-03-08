#!/usr/bin/env bash
set -euo pipefail

# set up dotfiles
cd ~
mkdir -p Downloads
mkdir -p Documents
mkdir -p Pictures
mkdir -p code

cp -n -l ~/dotfiles/* ~
cp -n -l ~/dotfiles/.* ~

# install software with xbps-install
sudo xbps-install sway unzip wget ripgrep firefox thunderbird gufw mosh zsh kitty vim emacs texlive-full stack
sudo xbps-install NetworkManger alsa-utils pulseaudio alsa-plugins-pulseaudio

# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install Nerd Fonts
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip

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



