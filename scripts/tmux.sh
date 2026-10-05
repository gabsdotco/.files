#!/bin/bash

set -e

echo "
#####################
# TMUX Installation #
#####################
"

#
# Paths
#

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_SOURCE="$SCRIPT_DIR/home/.tmux.conf"
CONFIG_TARGET="$HOME/.tmux.conf"
TPM_DIR="$HOME/.tmux/plugins/tpm"

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
    else
        echo "[!] Homebrew installation completed, but brew could not be found."
        exit 1
    fi
else
    echo "[✓] Homebrew is already installed."
fi

########
# Tmux #
########

echo ""

if ! command -v tmux &> /dev/null; then
    echo "[!] Tmux is not installed."
    echo "> Updating Homebrew..."
    echo ""

    brew update

    echo "> Installing Tmux..."
    echo ""

    brew install tmux

    echo "[✓] Tmux installed."
else
    echo "[✓] Tmux is already installed."
fi

echo ""
echo "> Tmux version:"
tmux -V

#############################
# TPM - Tmux Plugin Manager #
#############################

echo ""
echo "> Configuring TPM..."

if [ -d "$TPM_DIR" ]; then
    echo "[✓] TPM is already installed."
else
    echo "> Installing TPM..."

    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"

    echo "[✓] TPM installed."
fi

######################
# Tmux configuration #
######################

echo ""
echo "> Configuring .tmux.conf..."

if [ ! -f "$CONFIG_SOURCE" ]; then
    echo "[!] Tmux config not found:"
    echo "    $CONFIG_SOURCE"
    exit 1
fi

if [ -L "$CONFIG_TARGET" ]; then
    CURRENT_TARGET="$(readlink "$CONFIG_TARGET")"

    if [ "$CURRENT_TARGET" = "$CONFIG_SOURCE" ]; then
        echo "[✓] .tmux.conf symlink already exists."
    else
        echo "[!] .tmux.conf symlink points somewhere else:"
        echo "    $CURRENT_TARGET"
        echo ""
        echo "    Expected:"
        echo "    $CONFIG_SOURCE"
        exit 1
    fi

elif [ -e "$CONFIG_TARGET" ]; then
    echo "[!] .tmux.conf already exists:"
    echo "    $CONFIG_TARGET"
    echo ""
    echo "    Not overwriting existing configuration."
    exit 1

else
    ln -s "$CONFIG_SOURCE" "$CONFIG_TARGET"
    echo "[✓] .tmux.conf linked."
fi

echo ""
echo "#####################"
echo "# Installation Done #"
echo "#####################"
