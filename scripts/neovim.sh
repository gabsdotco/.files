#!/bin/bash

echo "
#######################
# Neovim Installation #
#######################"

# Installing Lua
echo ""
echo "> Installing Lua"
echo ""

if ! command -v lua &> /dev/null; then
    echo "[!] Lua is not installed. Installing now..."
    echo ""

    sudo apt install lua5.3
else
    echo "[!] Lua is already installed."
fi

# Installing required Telescope dependencies
echo ""
echo "> Installing required Telescope dependencies ('ripgrep' and 'fd-find')"
echo ""

if ! command -v rg &> /dev/null; then
    echo "[!] ripgrep is not installed. Installing now..."
    echo ""
    
    sudo apt-get install ripgrep
else
    echo "[!] ripgrep is already installed."
fi

if ! command -v fdfind &> /dev/null; then
    echo "[!] fd-find is not installed. Installing now..."
    echo ""
    
    sudo apt-get install fd-find
else
    echo "[!] fd-find is already installed."
fi

# Installing Bob
echo ""
echo "> Installing Bob"
echo ""

if ! command -v bob &> /dev/null; then
    echo "[!] Bob is not installed. Installing now..."
    echo ""

    cargo install bob-nvim
else
    echo "[!] Bob is already installed."
fi

# Clone the Neovim repository to .config/nvim
echo ""
echo "> Cloning the custom Neovim configuration"
echo ""

if [ ! -d "$HOME/.config/nvim" ]; then
    echo "Cloning the custom Neovim configuration"
    git clone https://github.com/gabsdotco/init.lua.git $HOME/.config/nvim
else
    echo "[!] Neovim configuration already exists at '$HOME/.config/nvim', run a 'git pull' command to update it."
fi
