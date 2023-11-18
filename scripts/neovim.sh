echo "
#######################
# Neovim Installation #
#######################
"

# Installing Required Telescope Dependencies
echo "Installing Ripgrep"
sudo apt-get install ripgrep

echo "Installing FD"
sudo apt install fd-find

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

# Clone the Neovim repository to .config/nvim
echo "Cloning the custom Neovim configuration"

git clone https://github.com/gabsdotco/init.lua.git $HOME/.config/nvim
