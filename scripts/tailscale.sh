#!/bin/bash

echo "
##########################
# Tailscale Installation #
##########################
"

if ! command -v tailscale &> /dev/null; then
    # Check if Tailscale is installed from App Store (macOS)
    if [ -d "/Applications/Tailscale.app" ]; then
        echo "[!] Tailscale App Store version found. Installing CLI via Homebrew..."
        echo ""

        if command -v brew &> /dev/null; then
            brew install tailscale
            echo "> Tailscale CLI installed via Homebrew"
            echo ""
            echo "Note: You may see a version mismatch warning until the App Store app updates."
            echo "The CLI still works correctly despite the warning."
        else
            echo "[!] Homebrew not found. Please install Homebrew first."
            exit 1
        fi
    else
        echo "[!] Tailscale is not installed. Installing Tailscale..."
        echo ""

        echo "> Installing Tailscale..."
        echo ""

        curl -fsSL https://tailscale.com/install.sh | sh

        echo "> Starting Tailscale..."
        echo ""

        sudo tailscale up
    fi
else
    echo "[!] Tailscale is already installed."
fi
