#!/bin/bash

######################
# Folders/Files Copy #
######################

# Copy all folders from .config to $HOME/.config
echo "Copying folders from .config to $HOME/.config"
for folder in .config/*; do
  cp -r $folder $HOME/.config
done

# Copy .tmux.conf to $HOME
echo "Copying .tmux.conf to $HOME"
cp .tmux.conf $HOME

# Copy .zshrc to $HOME
echo "Copying .zshrc to $HOME"
cp .zshrc $HOME
