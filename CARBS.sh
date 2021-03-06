#!/usr/bin/env bash
set -euo pipefail

sudo apt update
sudo apt upgrade -y

sudo apt install -y sway fzf j4-dmenu-desktop waybar wl-clipboard wget ripgrep firefox thunderbird gufw openssh-client topenssh-server mosh zsh kitty gvim emacs-nox texlive haskell-stack

cd $HOME
mkdir Downloads
mkdir Documents
mkdir Pictures

cp -n -l $HOME/dotfiles/* $HOME
