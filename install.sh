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

nvm install --lts

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

echo "
#######################
# ZSH Plugins Install #
#######################
"

echo "Installing ZSH Autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Installing ZSH Syntax Highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Installing ZSH Z"
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z

echo "Installing ZSH FZF"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "Installing ZSH Typewritten Theme"
git clone https://github.com/reobin/typewritten.git $ZSH_CUSTOM/themes/typewritten

source ~/.zshrc

echo "
######################
# Fonts Install      #
######################
"

echo "Installing JetBrains Mono Nerd Font"
mkdir -p ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
unzip JetBrainsMono.zip -d ~/.local/share/fonts
rm JetBrainsMono.zip
fc-cache -fv

echo "
#########################
# Installing Other Deps #
#########################
"

echo "Installing Ripgrep"
sudo apt-get install ripgrep

echo "Installing FD"
sudo apt install fd-find
