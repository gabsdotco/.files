#!/bin/bash

set -e

echo "
##########################
# Alacritty Installation #
##########################
"

CONFIG_SOURCE="$(pwd)/config/alacritty"
CONFIG_TARGET="$HOME/.config/alacritty"

############
# Homebrew #
############

if ! command -v brew &> /dev/null; then
    echo "[!] Homebrew is not installed."
    echo "> Installing Homebrew..."
    echo ""

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Apple Silicon
    if [ -x "/opt/homebrew/bin/brew" ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    # Intel
    elif [ -x "/usr/local/bin/brew" ]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
else
    echo "[✓] Homebrew is already installed."
fi

#############
# Alacritty #
#############

if ! command -v alacritty &> /dev/null; then
    echo ""
    echo "[!] Alacritty is not installed."
    echo "> Updating Homebrew..."
    echo ""

    brew update

    echo "> Installing Alacritty..."
    echo ""

    brew install --cask alacritty
else
    echo ""
    echo "[✓] Alacritty is already installed."
fi

###########################
# Alacritty Configuration #
###########################

echo ""
echo "> Configuring Alacritty..."
echo ""

mkdir -p "$HOME/.config"

if [ -L "$CONFIG_TARGET" ]; then
    CURRENT_TARGET="$(readlink "$CONFIG_TARGET")"

    if [ "$CURRENT_TARGET" = "$CONFIG_SOURCE" ]; then
        echo "[✓] Alacritty config symlink already exists."
    else
        echo "[!] Alacritty config symlink points somewhere else:"
        echo "    $CURRENT_TARGET"
        echo ""
        echo "    Expected:"
        echo "    $CONFIG_SOURCE"
        exit 1
    fi

elif [ -e "$CONFIG_TARGET" ]; then
    echo "[!] Alacritty config already exists:"
    echo "    $CONFIG_TARGET"
    echo ""
    echo "    Not overwriting existing configuration."
    exit 1

else
    ln -s "$CONFIG_SOURCE" "$CONFIG_TARGET"
    echo "[✓] Alacritty config linked."
fi

echo ""
echo "##########################"
echo "# Installation Complete! #"
echo "##########################"
