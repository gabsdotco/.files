echo "
#######################
# Fonts Installations #
#######################
"

echo "Installing JetBrains Mono Nerd Font"

mkdir -p ~/.local/share/fonts

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip

unzip JetBrainsMono.zip -d ~/.local/share/fonts

rm JetBrainsMono.zip

fc-cache -fv
