#!/bin/bash

# Detect package manager
if command -v apt >/dev/null 2>&1; then
    pkg_add="apt"
elif command -v dnf >/dev/null 2>&1; then
    pkg_add="dnf"
else
    echo "[INFO] No supported package manager found (apt or dnf)."
    exit 1
fi

# List of required commands
apps=(stow nano git tmux)

# Check and install missing commands
for app in "${apps[@]}"; do
    if ! command -v "$app" >/dev/null 2>&1; then
        echo "[INFO] $app not found. Installing..."
        sudo $pkg_add install -y $app >/dev/null 2>&1
    else
        echo "[INFO] $app is already installed."
    fi
done

# Check Neovim version
install_nvim=false

if command -v nvim >/dev/null 2>&1; then
    current_version=$(nvim --version | head -n1 | awk '{print $2}' | sed 's/^v//')
    # Compare versions (0.9.0 or higher)
    if [ "$(printf '%s\n' "0.9.0" "$current_version" | sort -V | head -n1)" != "0.9.0" ]; then
        echo "[INFO] Neovim version $current_version is older than 0.9.0"
        install_nvim=true
        echo "[INFO] Removing old nvim version..."
        sudo $pkg_add remove -y neovim >/dev/null 2>&1
    else
        echo "[INFO] Neovim version $current_version is sufficient."
    fi
else
    echo "[INFO] Neovim not found. Installing..."
    install_nvim=true
fi

if [ "$install_nvim" = true ]; then
    echo "[INFO] Installing Neovim >= 0.9.0..."
    # Make sure /opt exists
    if [ ! -d /opt ]; then
        echo "[INFO] /opt does not exist. Creating it..."
        sudo mkdir -p /opt
    fi

    curl -LOs https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    rm nvim-linux-x86_64.tar.gz
    echo "[INFO] Neovim installed to /opt/nvim"
fi

echo "[INFO] Linking dotfiles with stow..."
stow -t ~ bash git nano nvim tmux

if ! grep -q "# CUSTOM CODE BY soulis.tech #" ~/.bashrc; then
    echo "[INFO] Appending custom bash config to ~/.bashrc..."
    cat .bashrc >> ~/.bashrc
else
    echo "[INFO] Custom bash config already present in ~/.bashrc."
fi
