#!/bin/sh
sudo -v
# install Hombrew
yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/mac/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
# Make sure we’re using the latest Homebrew.
#brew update

# Upgrade any already-installed formulae.
TEMP_BREWFILE=$(mktemp) && curl https://raw.githubusercontent.com/maciej-pawlak/.dotfiles/master/osx/Brewfile > $TEMP_BREWFILE 
brew bundle --file=$TEMP_BREWFILE

echo "** delete temporary Brewfile: $TEMP_BREWFILE"
rm $TEMP_BREWFILE

echo '* Run .macos script'
TEMP_MACOS=$(mktemp) && curl https://raw.githubusercontent.com/maciej-pawlak/.dotfiles/master/osx/.macos > $TEMP_MACOS
sh $TEMP_MACOS

echo "** delete temporary .macos file: $TEMP_MACOS"
rm $TEMP_MACOS
# echo "Restart computer now"

# sudo shutdown -r now


# TMPF=$(mktemp) && curl https://raw.githubusercontent.com/maciej-pawlak/.dotfiles/master/osx/.init.sh > $TMPF && sh $TMPF
