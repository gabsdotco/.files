#!/bin/bash

echo "
####################
# GVM Installation #
####################
"

if ! command -v bison &> /dev/null; then
    echo "[!] Bison is not installed. Installing now..."
    echo ""

    sudo apt-get install bison
else
    echo "[!] Bison is already installed."
fi

if ! command -v gvm &> /dev/null; then
    echo "[!] GVM is not installed. Installing now..."
    echo ""

    bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
else
    echo "[!] GVM is already installed."
fi

