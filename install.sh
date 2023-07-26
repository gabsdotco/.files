#!/bin/bash

echo "
######################
# Deps/Pkgs Install  #
######################
"

# Installing Neovim
echo "Installing Neovim"

mkdir temp
cd ./temp

wget https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.tar.gz
tar xvf nvim-linux64.tar.gz

sudo mv nvim-linux64/ /usr/local/neovim-0.8.3
sudo ln -s /usr/local/neovim-0.8.3/bin/nvim /usr/local/bin/nvim

nvim --version

cd ..
rm -rf ./temp

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Installing Tmux
echo "Installing Tmux"

sudo apt update
sudo apt install tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

tmux -V

# Installing NVM
echo "Installing NVM"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

nvm install lts
nvm use lts

nvm --version
node -v
npm -v

# Installing ZSH
echo "Installing ZSH"

sudo apt install zsh

# Installing Oh My ZSH
echo "Installing Oh My ZSH"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Installing Docker
echo "Installing Docker"

sudo apt install docker.io

docker --version
sudo usermod -aG docker $USER

# Installing Docker Compose
echo "Installing Docker Compose"

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

docker-compose --version

echo "
######################
# Folders/Files Copy #
######################
"

# Clone the Neovim repository to .config/nvim
echo "Cloning the custom Neovim configuration"

git clone https://github.com/gabsdotco/init.lua.git ~/.config/nvim

# Copy .tmux.conf to $HOME
echo "Copying .tmux.conf to $HOME"

cp .tmux.conf $HOME

# Copy .zshrc to $HOME
echo "Copying .zshrc to $HOME"

cp .zshrc $HOME
