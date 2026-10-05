#!/bin/bash

set -e

echo "
####################
# GVM Installation #
####################
"

############
# Homebrew #
############

if ! command -v brew &> /dev/null; then
    echo "[!] Homebrew is not installed."
    echo "> Please install Homebrew first."
    exit 1
fi

#########
# Bison #
#########

if ! command -v bison &> /dev/null; then
    echo "[!] Bison is not installed."
    echo "> Installing Bison..."
    echo ""

    brew install bison

    BISON_PREFIX="$(brew --prefix bison)"

    if ! grep -q "$BISON_PREFIX/bin" "$HOME/.zshrc"; then
        echo ""
        echo "> Adding Bison to PATH..."

        cat >> "$HOME/.zshrc" <<EOF

# Bison
export PATH="$BISON_PREFIX/bin:\$PATH"
EOF
    fi

    export PATH="$BISON_PREFIX/bin:$PATH"

    echo "[✓] Bison installed."
else
    echo "[✓] Bison is already installed."
fi

#######
# GVM #
#######

if ! command -v gvm &> /dev/null; then
    echo ""
    echo "[!] GVM is not installed."
    echo "> Installing GVM..."
    echo ""

    bash < <(
        curl -s -S -L \
        https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer
    )

    echo "[✓] GVM installed."
else
    echo ""
    echo "[✓] GVM is already installed."
fi

echo ""
echo "####################"
echo "# Installation Done #"
echo "####################"
