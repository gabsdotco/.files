echo "
#######################
# Neovim Installation #
#######################
"

# Installing Lua
echo "Installing Lua"
curl -L -R -O https://www.lua.org/ftp/lua-5.4.7.tar.gz
tar zxf lua-5.4.7.tar.gz
cd lua-5.4.7
make all test

# Remove the lua-5.4.7 directory
echo "Removing Lua tarball"
cd ..
rm -rf lua-5.4.7
rm lua-5.4.7.tar.gz

# Installing Required Telescope Dependencies
echo "Installing Ripgrep"
sudo apt-get install ripgrep

echo "Installing FD"
sudo apt install fd-find

# Installing Bob
echo "Installing Bob"
cargo install bob-nvim

# Clone the Neovim repository to .config/nvim
echo "Cloning the custom Neovim configuration"
git clone https://github.com/gabsdotco/init.lua.git $HOME/.config/nvim
