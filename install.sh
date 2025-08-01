#!/bin/bash
#
# Description: A script to set up a new macOS machine.
# It installs Homebrew, command-line tools, applications,
# and symlinks dotfiles from the repository.

set -e # Exit immediately if a command exits with a non-zero status.

# ---
# Configuration Variables
# ---

# Assume the script is in the root of the dotfiles directory
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HOME_DIR="$HOME"

# List of files/folders to symlink
# Format: "source:destination"
SYMLINKS=(
    "gitconfig:.gitconfig"
    "zshrc:.zshrc"
    "tmux.conf:.tmux.conf"
    "nvim:.config/nvim"
)

# Homebrew packages to install
BREW_PACKAGES=(
    "bat"
    "neovim"
    "tmux"
    "fd"
    "antidote"
    "starship"
    "uv"
)

# Homebrew casks (GUI apps) to install
BREW_CASKS=(
    "font-fira-code-nerd-font"
    "spotify"
    "raycast"
    "ghostty"
    "zen-by-mozilla" # Zen Browser
)


# ---
# Main Functions
# ---

# 1. Install Homebrew
install_homebrew() {
    echo "Checking for Homebrew..."
    if command -v brew &> /dev/null; then
        echo "Homebrew is already installed. Updating..."
        brew update
    else
        echo "Homebrew not found. Installing..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        # Add Homebrew to PATH for this script's session
        if [[ "$(uname -m)" == "arm64" ]]; then # Apple Silicon
            export PATH="/opt/homebrew/bin:$PATH"
        else # Intel
            export PATH="/usr/local/bin:$PATH"
        fi
        echo "Homebrew installation complete."
    fi
}

# 2. Create Symlinks
setup_symlinks() {
    echo "Setting up symlinks..."

    # Ensure .config directory exists
    if [ ! -d "$HOME_DIR/.config" ]; then
        echo "Creating ~/.config directory."
        mkdir -p "$HOME_DIR/.config"
    fi

    for link in "${SYMLINKS[@]}"; do
        IFS=':' read -r source dest <<< "$link"

        source_path="$DOTFILES_DIR/$source"
        dest_path="$HOME_DIR/$dest"

        # If the destination exists and is not a symlink, back it up
        if [ -e "$dest_path" ] && [ ! -L "$dest_path" ]; then
            echo "Backing up existing file: $dest_path to ${dest_path}.bak"
            mv "$dest_path" "${dest_path}.bak"
        fi

        # Create the symlink, overwriting if it exists
        ln -sf "$source_path" "$dest_path"
        echo "Symlinked $source_path -> $dest_path"
    done
}

# 3. Install Homebrew Packages and Casks
install_brew_packages() {
    echo "Installing Homebrew packages..."
    for pkg in "${BREW_PACKAGES[@]}"; do
        if brew list "$pkg" &> /dev/null; then
            echo "$pkg is already installed."
        else
            echo "Installing $pkg..."
            brew install "$pkg"
        fi
    done

    echo "Installing Homebrew casks..."
    for cask in "${BREW_CASKS[@]}"; do
        if brew list --cask "$cask" &> /dev/null; then
            echo "$cask is already installed."
        else
            echo "Installing $cask..."
            brew install --cask "$cask"
        fi
    done
}

# 4. Install Plugin Managers
install_plugins() {
    echo "Installing Tmux Plugin Manager (TPM)..."
    tpm_path="$HOME/.tmux/plugins/tpm"
    if [ ! -d "$tpm_path" ]; then
        git clone https://github.com/tmux-plugins/tpm "$tpm_path"
        echo "TPM installed successfully."
    else
        echo "TPM is already installed."
    fi
}

# ---
# Main Execution
# ---
main() {
    echo "Starting MacBook setup..."

    install_homebrew
    setup_symlinks
    install_brew_packages
    install_plugins

    echo "--------------------------------------------------"
    echo "✅ Setup complete!"
    echo "--------------------------------------------------"
    echo "Next steps:"
    echo "1. Restart your terminal for all changes to take effect."
    echo "2. Open Tmux and press 'prefix + I' (e.g., Ctrl+b + I) to install the configured plugins."
    echo "3. Your Zsh plugins will be managed by Antidote as per your zshrc."
}

# Run the main function
main

