#!/bin/bash

# Setup homebrew, check if it is installed first
if ! command -v brew &> /dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo >> /Users/jmakela/.zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> /Users/jmakela/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv zsh)"
fi

brew install git
brew install gnupg pinentry-mac

BASEDIR=$(dirname $(readlink -f $0))

# Create symlinks
$BASEDIR/link.sh

brew bundle
