#!/bin/bash

# Setup homebrew, make this check if it is installed first
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo >> /Users/jmakela/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> /Users/jmakela/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

brew install git
brew install gnupg pinentry-mac

# Ask user to setup SSH keys with github, link to documentation
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

# Ask user to setup GPG keys with github

BASEDIR=$(dirname $(readlink -f $0))

ln -sf $BASEDIR/.zshrc $HOME/.zshrc
ln -sf $BASEDIR/.zprofile $HOME/.zprofile
ln -sf $BASEDIR/.gitconfig $HOME/.gitconfig

brew bundle
