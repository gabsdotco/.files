#!/bin/bash

set -e

echo "
#####################
# Font Installation #
#####################
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
# Fonts
#

FONTS=(
    "font-jetbrains-mono-nerd-font"
)

echo "> Installing fonts..."
echo ""

for font in "${FONTS[@]}"; do
    if brew list --cask "$font" &> /dev/null; then
        echo "[✓] $font is already installed."
    else
        echo "[!] $font is not installed."
        echo "> Installing $font..."

        brew install --cask "$font"

        echo "[✓] $font installed."
    fi
done

echo ""
echo "#####################"
echo "# Installation Done #"
echo "#####################"
