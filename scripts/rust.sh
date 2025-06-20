#!/bin/bash

echo "
#####################
# Rust Installation #
#####################
"

if [ ! -d "$HOME/.cargo" ]; then
    echo "[!] Rust is not installed. Installing now..."
    echo ""

    # Install Rust using rustup
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
    echo "[!] Rust is already installed."
fi
