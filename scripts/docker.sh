#!/bin/bash

echo "
#######################
# Docker Installation #
#######################
"

if ! command -v docker &> /dev/null; then
    echo "[!] Docker is not installed. Installing Docker..."
    echo ""

    sudo apt install docker.io
    sudo usermod -aG docker $USER

    docker --version
    docker-compose --version
else
    echo "[!] Docker is already installed."
fi
