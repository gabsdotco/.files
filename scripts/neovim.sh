#!/bin/bash

set -e

echo "
#######################
# Neovim Installation #
#######################
"

#
# Homebrew
#

if ! command -v brew &> /dev/null; then
    echo "[!] Homebrew is not installed."
    echo "> Please install Homebrew first."
    exit 1
fi

#
# Lua
#

echo ""
echo "> Checking Lua..."
echo ""

if ! command -v lua &> /dev/null; then
    echo "[!] Lua is not installed."
    echo "> Installing Lua..."

    brew install lua

    echo "[✓] Lua installed."
else
    echo "[✓] Lua is already installed."
fi

#
# Telescope dependencies
#

echo ""
echo "> Installing required Telescope dependencies (ripgrep and fd)..."
echo ""

#
# ripgrep
#

if ! command -v rg &> /dev/null; then
    echo "[!] ripgrep is not installed."
    echo "> Installing ripgrep..."

    brew install ripgrep

    echo "[✓] ripgrep installed."
else
    echo "[✓] ripgrep is already installed."
fi

#
# fd
#

if ! command -v fd &> /dev/null; then
    echo "[!] fd is not installed."
    echo "> Installing fd..."

    brew install fd

    echo "[✓] fd installed."
else
    echo "[✓] fd is already installed."
fi

#
# Bob
#

echo ""
echo "> Installing Bob..."
echo ""

if ! command -v bob &> /dev/null; then
    if ! command -v cargo &> /dev/null; then
        echo "[!] Cargo is not installed."
        echo "[!] Please install Rust before installing Bob."
        exit 1
    fi

    echo "[!] Bob is not installed."
    echo "> Installing Bob..."

    cargo install bob-nvim

    echo "[✓] Bob installed."
else
    echo "[✓] Bob is already installed."
fi

#
# Neovim
#

echo ""
echo "> Installing Neovim..."
echo ""

if ! command -v nvim &> /dev/null; then
    echo "[!] Neovim is not installed."
    echo "> Installing Neovim..."

    brew install neovim

    echo "[✓] Neovim installed."
else
    echo "[✓] Neovim is already installed."
fi

#
# Neovim configuration
#

echo ""
echo "> Configuring Neovim..."
echo ""

NVIM_CONFIG="$HOME/.config/nvim"

mkdir -p "$HOME/.config"

if [ -d "$NVIM_CONFIG" ]; then
    echo "[!] Neovim configuration already exists at:"
    echo "    $NVIM_CONFIG"
    echo ""
    echo "    Run 'git pull' inside the directory to update it."
else
    echo "> Cloning custom Neovim configuration..."

    git clone \
        https://github.com/gabsdotco/init.lua.git \
        "$NVIM_CONFIG"

    echo "[✓] Neovim configuration installed."
fi

echo ""
echo "#######################"
echo "# Installation Done! #"
echo "#######################"
