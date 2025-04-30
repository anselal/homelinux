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
        sudo $pkg_add install -y "$app" >/dev/null 2>&1
    else
        echo "[INFO] $app is already installed."
    fi
done

# Function to install latest Neovim from GitHub
install_latest_nvim() {
    echo "[INFO] Installing Neovim >= 0.9.0..."
    if [ ! -d /opt ]; then
        echo "[INFO] /opt does not exist. Creating it..."
        sudo mkdir -p /opt
    fi

    curl -LOs https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    sudo rm -rf /opt/nvim-linux-x86_64
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    rm nvim-linux-x86_64.tar.gz
    echo "[INFO] Neovim installed to /opt/nvim-linux-x86_64"
    sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
    echo "[INFO] Linked nvim to /usr/local/bin/nvim"
}

# Check Neovim
install_nvim=false

if command -v nvim >/dev/null 2>&1; then
    current_version=$(nvim --version | head -n1 | awk '{print $2}' | sed 's/^v//')
    echo "[INFO] Current Neovim version: $current_version"

    # Get latest version from GitHub
    latest_version=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
    echo "[INFO] Latest Neovim version: $latest_version"

    # Check if version is >= 0.9.0
    if [ "$(printf '%s\n' "0.9.0" "$current_version" | sort -V | head -n1)" != "0.9.0" ]; then
        echo "[INFO] Installed Neovim version $current_version is older than required minimum (0.9.0)."
        install_nvim=true
    # Check if version is latest
    elif [ "$current_version" != "$latest_version" ]; then
        echo "[INFO] A newer Neovim version is available."
        install_nvim=true
    else
        echo "[INFO] Neovim is up to date and >= 0.9.0."
    fi

    if [ "$install_nvim" = true ]; then
        nvim_path=$(command -v nvim)
        if [ -L "$nvim_path" ]; then
            target=$(readlink -f "$nvim_path")
            if [[ "$target" == /opt/nvim-linux-x86_64/* ]]; then
                echo "[INFO] Removing Neovim installed at /opt/nvim-linux-x86_64..."
                sudo rm -rf /opt/nvim-linux-x86_64
            else
                echo "[INFO] Neovim symlink target is $target (unknown source)."
            fi
        else
            echo "[INFO] Removing Neovim installed via package manager..."
            sudo $pkg_add remove -y neovim >/dev/null 2>&1
        fi
    fi
else
    echo "[INFO] Neovim not found. Installing..."
    install_nvim=true
fi

if [ "$install_nvim" = true ]; then
    install_latest_nvim
fi

echo "[INFO] Linking dotfiles with stow..."
stow -t ~ bash git nano nvim tmux

if ! grep -q "# CUSTOM CODE BY soulis.tech #" ~/.bashrc; then
    echo "[INFO] Appending custom bash config to ~/.bashrc..."
    cat .bashrc >> ~/.bashrc
else
    echo "[INFO] Custom bash config already present in ~/.bashrc."
fi

