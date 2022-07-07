#!/bin/sh
sudo -v
# install Hombrew
yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/mac/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
# Make sure we’re using the latest Homebrew.
#brew update

# Upgrade any already-installed formulae.
#brew upgrade

brew bundle

# ./.macos
# echo "Restart computer in 1 minute"

# sudo shutdown -r now