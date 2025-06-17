#!/bin/bash

echo "
#######################
# Docker Installation #
#######################
"

if ! command -v docker &> /dev/null; then
    echo "[!] Docker is not installed. Installing Docker..."
    echo ""

    echo "> Installing Docker..."
    echo ""

    curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
    sudo sh /tmp/get-docker.sh

    echo "> Installing Docker Compose..."
    echo ""

    sudo apt-get update
    sudo apt-get install docker-compose-plugin

    echo "> Adding user to the Docker group..."
    echo ""

    sudo groupadd docker
    sudo usermod -aG docker $USER

    sudo systemctl enable docker.service
    sudo systemctl enable containerd.service
else
    echo "[!] Docker is already installed."
fi
