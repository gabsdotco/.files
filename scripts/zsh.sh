#!/bin/bash

set -e

echo "
####################
# ZSH Installation #
####################
"

#########
# Paths #
#########

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

CONFIG_SOURCE="$DOTFILES_DIR/home/.zshrc"
CONFIG_TARGET="$HOME/.zshrc"

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

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

#######
# ZSH #
#######

echo ""

if ! command -v zsh &> /dev/null; then
    echo "[!] ZSH is not installed."
    echo "> Installing ZSH..."
    echo ""

    brew install zsh

    echo "[✓] ZSH installed."
else
    echo "[✓] ZSH is already installed."
fi

#############
# Oh My ZSH #
#############

echo ""

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "> Installing Oh My ZSH..."
    echo ""

    RUNZSH=no CHSH=no sh -c \
        "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    echo "[✓] Oh My ZSH installed."
else
    echo "[✓] Oh My ZSH is already installed."
fi

#######################
# ZSH Autosuggestions #
#######################

echo ""
echo "> Installing ZSH Autosuggestions..."

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone \
        https://github.com/zsh-users/zsh-autosuggestions \
        "$ZSH_CUSTOM/plugins/zsh-autosuggestions"

    echo "[✓] ZSH Autosuggestions installed."
else
    echo "[✓] ZSH Autosuggestions is already installed."
fi

###########################
# ZSH Syntax Highlighting #
###########################

echo ""
echo "> Installing ZSH Syntax Highlighting..."

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone \
        https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

    echo "[✓] ZSH Syntax Highlighting installed."
else
    echo "[✓] ZSH Syntax Highlighting is already installed."
fi

#########
# ZSH Z #
#########

echo ""
echo "> Installing ZSH Z..."

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-z" ]; then
    git clone \
        https://github.com/agkozak/zsh-z \
        "$ZSH_CUSTOM/plugins/zsh-z"

    echo "[✓] ZSH Z installed."
else
    echo "[✓] ZSH Z is already installed."
fi

#######
# FZF #
#######

echo ""
echo "> Installing FZF..."

if ! command -v fzf &> /dev/null; then
    brew install fzf

    echo "[✓] FZF installed."
else
    echo "[✓] FZF is already installed."
fi

#########################
# FZF shell integration #
#########################

echo ""
echo "> Configuring FZF shell integration..."

if [ -x "$(brew --prefix)/opt/fzf/install" ]; then
    "$(brew --prefix)/opt/fzf/install" \
        --key-bindings \
        --completion \
        --no-update-rc

    echo "[✓] FZF shell integration configured."
fi

###############
# Typewritten #
###############

TYPEWRITTEN_DIR="$HOME/.zsh/typewritten"

echo ""
echo "> Installing Typewritten..."

mkdir -p "$HOME/.zsh"

if [ -d "$TYPEWRITTEN_DIR" ]; then
    echo "[✓] Typewritten is already installed."
else
    git clone \
        https://github.com/reobin/typewritten.git \
        "$TYPEWRITTEN_DIR"

    echo "[✓] Typewritten installed."
fi

#####################
# ZSH Configuration #
#####################

echo ""
echo "> Configuring .zshrc..."

if [ ! -f "$CONFIG_SOURCE" ]; then
    echo "[!] .zshrc not found:"
    echo "    $CONFIG_SOURCE"
    exit 1
fi

if [ -L "$CONFIG_TARGET" ]; then
    CURRENT_TARGET="$(readlink "$CONFIG_TARGET")"

    if [ "$CURRENT_TARGET" = "$CONFIG_SOURCE" ]; then
        echo "[✓] .zshrc symlink already exists."
    else
        echo "[!] .zshrc symlink points somewhere else:"
        echo "    $CURRENT_TARGET"
        echo ""
        echo "    Expected:"
        echo "    $CONFIG_SOURCE"
        exit 1
    fi

elif [ -e "$CONFIG_TARGET" ]; then
    echo "[!] .zshrc already exists:"
    echo "    $CONFIG_TARGET"
    echo ""
    echo "    Not overwriting existing configuration."
    exit 1

else
    ln -s "$CONFIG_SOURCE" "$CONFIG_TARGET"

    echo "[✓] .zshrc linked."
fi

echo ""
echo "#####################"
echo "# Installation Done #"
echo "#####################"
