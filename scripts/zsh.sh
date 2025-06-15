#!/bin/bash

echo "
####################
# ZSH Installation #
####################
"

if ! command -v zsh &> /dev/null; then
    echo "[!] ZSH is not installed. Installing ZSH..."

    echo "> Installing ZSH via apt"
    echo ""

    sudo apt install zsh

    # Installing Oh My ZSH
    
    echo "> Installing Oh My ZSH"
    echo ""

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Installing ZSH Plugins
    
    echo "> Installing ZSH Autosuggestions"
    echo ""

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    echo "> Installing ZSH Syntax Highlighting"
    echo ""
    
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    echo "> Installing ZSH Z"
    echo ""

    git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z

    echo "> Installing ZSH FZF"
    echo ""

    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

    ~/.fzf/install

    echo "> Installing ZSH Typewritten Theme"
    echo ""

    git clone https://github.com/reobin/typewritten.git $ZSH_CUSTOM/themes/typewritten

    echo "> Creating symlink for .zshrc"
    echo ""

    ln -s "$(pwd)/home/.zshrc" $HOME/.zshrc

    echo "> Sourcing '.zshrc'"
    source $HOME/.zshrc
else
    echo "[!] ZSH is already installed."
fi
