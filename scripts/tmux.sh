echo "
######################
# TMUX Installation  #
######################
"

# Installing Tmux
echo "Installing Tmux"

sudo apt update
sudo apt install tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

tmux -V

# Copy .tmux.conf to $HOME
echo "Copying .tmux.conf to $HOME"

cp ./home/.tmux.conf $HOME
