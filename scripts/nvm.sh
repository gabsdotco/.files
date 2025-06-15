#!/bin/bash

echo "
####################
# NVM Installation #
####################
"

if [ -e "~/.nvm/nvm.sh" ]; then
    echo "[!] NVM is not installed. Installing now..."
    echo ""

    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

    nvm install --lts
    nvm alias default lts

    node -v
    npm -v
else
    echo "[!] NVM is already installed."
fi
