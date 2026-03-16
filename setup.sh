#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

# trying to prevent from asking for sudo password again but this is not working
export NONINTERACTIVE=1

# Setup Finder Commands
# Show Library Folder in Finder
chflags nohidden ~/Library

# Show Hidden Files in Finder
defaults write com.apple.finder AppleShowAllFiles YES

# Show Path Bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Show Status Bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

if test ! "$(which uv)"; then
    echo "Installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    
else
    echo "UV already installed!"
fi

uv python install --default

# Check for Homebrew, and then install it
if test ! "$(which brew)"; then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Homebrew installed successfully"
else
    echo "Homebrew already installed!"
fi

# Install XCode Command Line Tools
echo 'Checking to see if XCode Command Line Tools are installed...'
brew config

# Updating Homebrew.
echo "Updating Homebrew..."
brew update

# Upgrade any already-installed formulae.
echo "Upgrading Homebrew..."
brew upgrade

# Setup shell config
# Define the file path
ZPROF="$HOME/.zprofile"

# Ensure the file exists so grep doesn't fail
touch "$ZPROF"

if ! grep -q "HOMEBREW_CASK_OPTS" "$ZPROF"; then
  cat << 'EOF' >> "$ZPROF"

# Homebrew
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
eval "$(/opt/homebrew/bin/brew shellenv)"
EOF
fi

if ! grep -q "VOLTA_HOME" "$ZPROF"; then
  cat << 'EOF' >> "$ZPROF"

# Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
EOF
fi

if ! grep -q "GO_HOME" "$ZPROF"; then
  cat << 'EOF' >> "$ZPROF"

# Go
export GO_HOME="$HOME/go"
export PATH="$PATH:$GO_HOME/bin"
EOF
fi

source "$ZPROF"

# Install everything from the Brewfile in current folder
echo "Installing Brewfile"
brew bundle install

echo "Uninstall Garage Band..."
mas uninstall 682658836 # uninstall garageband 

# Accept XCode license
sudo xcodebuild -license accept

# Remove outdated versions from the cellar.
echo "Running brew cleanup..."
brew bundle cleanup
brew cleanup
echo "You're done!"
