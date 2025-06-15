#!/bin/bash

echo "
####################
# ZSH Installation #
####################
"

# Installing ZSH
echo "Installing ZSH"
sudo apt install zsh

# Installing Oh My ZSH
echo "Installing Oh My ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Installing ZSH Plugins
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

# Copy .zshrc to $HOME
echo "Copying .zshrc to $HOME"

cp ./home/.zshrc $HOME

source ~/.zshrc
