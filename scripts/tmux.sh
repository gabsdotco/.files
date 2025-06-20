#!/bin/bash

echo "
#####################
# TMUX Installation #
#####################
"

if ! command -v tmux &> /dev/null; then
    echo "[!] Tmux is not installed. Installing Tmux..."
    echo ""

    sudo apt update
    sudo apt install tmux

    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    tmux -V

    echo "> Creating symlink for .tmux.conf"

    ln -s "$(pwd)/home/.tmux.conf" $HOME/.tmux.conf
else
    echo "[!] Tmux is already installed."
fi
