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
TEMP_BREWFILE=$(mktemp) && curl https://raw.githubusercontent.com/maciej-pawlak/.dotfiles/master/osx/Brewfile > $TEMP_BREWFILE && brew bundle --file=$TEMP_BREWFILE

# ./.macos
# echo "Restart computer in 1 minute"

# sudo shutdown -r now


# TMPF=$(mktemp) && curl https://raw.githubusercontent.com/maciej-pawlak/.dotfiles/master/osx/.init.sh > $TMPF && sh $TMPF
