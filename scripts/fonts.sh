#!/bin/bash

echo "
#######################
# Fonts Installations #
#######################"

echo ""
echo "> Installing JetBrains Mono Nerd Font"
echo ""

if ! grep -q "JetBrains Mono" ~/.local/share/fonts/*; then
    echo "[!] JetBrains Mono Nerd Font is not installed. Installing now..."
    echo ""

    mkdir -p ~/.local/share/fonts

    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip

    unzip JetBrainsMono.zip -d ~/.local/share/fonts

    rm JetBrainsMono.zip

    fc-cache -fv
else
    echo "[!] JetBrains Mono Nerd Font is already installed."
fi

