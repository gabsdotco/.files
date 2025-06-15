#!/bin/bash

echo "
##########################
# Alacritty Installation #
##########################
"

if ! command -v alacritty &> /dev/null; then
    echo "[!] Alacritty is not installed. Installing Alacritty..."
    echo ""

    echo "> Updating and upgrading system packages..."
    echo ""

    sudo apt update
    sudo apt upgrade

    echo "> Adding Alacritty PPA..."
    echo ""

    sudo add-apt-repository ppa:aslatter/ppa -y

    echo "> Installing Alacritty..."
    echo ""

    sudo apt install alacritty

    echo "> Creating symlink for Alacritty config"

    ln -ds "$(pwd)/config/alacritty" $HOME/.config/alacritty
else
    echo "[!] Alacritty is already installed."
fi
