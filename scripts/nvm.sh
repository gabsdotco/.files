echo "
####################
# NVM Installation #
####################
"

# Installing NVM
echo "Installing NVM"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

nvm install --lts

node -v
npm -v
