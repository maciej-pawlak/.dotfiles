#!/bin/sh

# Ask for the administrator password upfront
sudo -v

# install Rosetta (A - agree license)
A | sudo softwareupdate --install-rosetta

# install Hombrew
yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/mac/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"


# run brew bundle
echo '* run brew bundle'
TEMP_BREWFILE=$(mktemp) && curl https://raw.githubusercontent.com/maciej-pawlak/.dotfiles/master/osx/Brewfile > $TEMP_BREWFILE 
brew bundle --file=$TEMP_BREWFILE

# run .macos script
echo '* run .macos script'
TEMP_MACOS=$(mktemp) && curl https://raw.githubusercontent.com/maciej-pawlak/.dotfiles/master/osx/.macos > $TEMP_MACOS
sh $TEMP_MACOS

# delete temporary files
echo "** delete temporary Brewfile: $TEMP_BREWFILE"
rm $TEMP_BREWFILE
echo "** delete temporary .macos file: $TEMP_MACOS"
rm $TEMP_MACOS


# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# sudo shutdown -r now