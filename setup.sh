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

# Install Git
echo "Installing Git..."
brew install git

# On macOS and Linux.
curl -LsSf https://astral.sh/uv/install.sh | sh
uv python install 3.14.2

# Install other useful binaries.

# Install Speedtest
echo "Installing Speedtest..."
brew install speedtest_cli

# Install arq
echo "Installing Arq..."
brew install arq

# Install BBEdit
echo "Installing BBEdit..."
brew install bbedit

# configure git to use BBEdit as the editor for commits
git config --global core.editor "bbedit -w"


# Install lighthouse
echo "Installing lighthouse..."
brew install lighthouse

# Install Brave Browser
echo "Installing Brave Browser..."
brew install brave-browser

# Install chronosync
echo "Installing ChronoSync"
brew install chronosync

# Install hazel
echo "Installing Hazel..."
brew install hazel

# Install Omnifocus
echo "Installing Omnifocus..."
brew install omnifocus
# Above install failed for me

# Install slack
echo "Installing Slack..."
brew install slack

# Install Signal
echo "Installing Signal..."
brew install signal

# Install Discord
echo "Installing Discord..."
brew install discord

# Install Telegram
echo "Installing Telegram..."
brew install telegram

# Install Transmission
echo "Installing Transmission..."
brew install transmission

# Install Transmit
echo "Installing Transmit..."
brew install transmit

# Install Handbrake
echo "Installing Handbrake..."
brew install handbrake

# Install Freedom
echo "Installing Freedom..."
brew install freedom

# Install Readwise ibooks app
echo "Installing Readwise ibooks app..."
brew install readwise-ibooks

# Install VLC app
echo "Installing VLC..."
brew install vlc

## Install OBS
echo "Install OBS..."
brew install --cask obs

# Install Clay
echo "Install Clay..."
brew install --cask clay

# Install Github Commandline...
echo "Install Github Command line..."
brew install gh

## Install Ledger Live...
echo "Install Ledger Live..."
brew install ledger-live

## Install Modern Development Tools...
echo "Installing Node.js..."
brew install node

echo "Installing Ollama (local LLM runner)..."
brew install ollama

echo "Installing KeyCastr (keystroke visualizer)..."
brew install keycastr

echo "Installing Ice (menu bar manager)..."
brew install jordanbaird-ice

echo "Installing GitHub Copilot for Xcode..."
brew install github-copilot-for-xcode

echo "Installing Elgato Stream Deck..."
brew install elgato-stream-deck

## Install Modern Code Editors...
echo "Installing Zed editor..."
brew install zed

echo "Installing Cursor (AI code editor)..."
brew install cursor

## Install Communication and Productivity Apps...
echo "Installing WhatsApp..."
brew install whatsapp

echo "Installing Linear..."
brew install linear

echo "Installing Tailscale..."
brew install tailscale

# Install Mac App Store Command line...
echo "Installing Mac App Store Command line..."
brew install mas

# Install Apps from the Mac App store
appStoreApps=(
	1333542190  # 1Password 7               (7.9.11)
	1225570693  # Ulysses                   (38.2)
	1153157709  # Speedtest                 (1.27)
	720669838   # iThoughtsX                (9.4)
	497799835   # Xcode                     (latest)
	1289119450  # URL Linker                (1.1)
	403504866   # PCalc                     (4.10.8)
	1640236961  # Save to Reader            (0.16.9)
	1303222628  # Paprika Recipe Manager 3  (3.8.1)
	1376878040  # BlueWallet                (7.1.9)
	899247664   # TestFlight                (3.8.0)
	409201541   # Pages                     (14.4)
	1055511498  # Day One                   (2025.11)
	639968404   # Parcel                    (7.15.4)
	1480068668  # Messenger                 (507.0.0)
	408981434   # iMovie                    (10.4.3)
	409203825   # Numbers                   (14.4)
	1544743900  # Hush                      (1.0.17)
	409183694   # Keynote                   (14.4)
	1358823008  # Flighty                   (4.5.1)
	6714467650  # Perplexity                (2.250522.0)
	904280696   # Things                    (3.21.11)
	1365531024  # 1Blocker
	1508732804  # Soulver
)

# Install AppStore apps
# WARNING: This tool can only reinstall apps that are already tied to you account. If you're downloading something for the first time do it through AppStore
mas install ${appStoreApps[@]}

mas uninstall 682658836

# Accept XCode license
sudo xcodebuild -license accept



# Remove outdated versions from the cellar.
echo "Running brew cleanup..."
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
