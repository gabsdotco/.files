echo "
##########################
# Alacritty Installation #
##########################
"

# Installing Alacritty
echo "Installing Alacritty"
sudo apt update
sudo apt upgrade
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt install alacritty

# Copy alacrity to $HOME
echo "Copying alacrity to $HOME/.config"

cp -r ./config/alacritty $HOME/.config/alacritty
