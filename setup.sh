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

# Install everything from the Brewfile in current folder
echo "Installing Brewfile"
brew bundle install

# On macOS and Linux.
curl -LsSf https://astral.sh/uv/install.sh | sh
uv python install 3.14.2

# configure git to use BBEdit as the editor for commits
git config --global core.editor "bbedit -w"


echo "Uninstall Garage Band..."
mas uninstall 682658836 # uninstall garageband 

# Accept XCode license
sudo xcodebuild -license accept

# Setup shell config
# Define the file path
ZENV="$HOME/.zshenv"

# Ensure the file exists so grep doesn't fail
touch "$ZENV"

# Only add the lines if they aren't already there
if ! grep -q "HOMEBREW_EDITOR" "$ZENV"; then
  cat << 'EOF' >> "$ZENV"

# BBEdit Configuration
export HOMEBREW_EDITOR="bbedit"
export EDITOR="bbedit"
EOF
fi
source ~/.zshrc


# Remove outdated versions from the cellar.
echo "Running brew cleanup..."
brew bundle cleanup
brew cleanup
echo "You're done!"

# Additional modern tools to consider
# default-folder-x
# karabiner-elements
# keyboard-maestro
# slack-cli
# proxyman

# Items that need to be manually installed:
# - [WordCounter](https://wordcounterapp.com)
# - Readwise
# - Insta360 Link Controller
# - [Exodus](https://www.exodus.com/m1/)
