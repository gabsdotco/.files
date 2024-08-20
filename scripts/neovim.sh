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

# Installing Bob
echo "Installing Bob"
cargo install bob-nvim

# Installing Packer
echo "Installing Packer"
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Clone the Neovim repository to .config/nvim
echo "Cloning the custom Neovim configuration"
git clone https://github.com/gabsdotco/init.lua.git $HOME/.config/nvim
