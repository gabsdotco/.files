#!/bin/bash

echo "
#######################
# Docker Installation #
#######################
"

# Installing Docker
echo "Installing Docker"

sudo apt install docker.io
sudo usermod -aG docker $USER

docker --version

# Installing Docker Compose
echo "Installing Docker Compose"

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

docker-compose --version
