#!/bin/bash

# Setup homebrew, check if it is installed first
if ! command -v brew &> /dev/null; then
  echo "Homebrew is not installed. Install it from https://brew.sh/ and re-run this script."
  exit 1
fi

BASEDIR=$(dirname $(readlink -f $0))
cd "$BASEDIR"

brew install git stow

brew bundle

mkdir -p ~/.gnupg ~/.config

# Create local git config if it doesn't exist
if [ ! -f "$HOME/.gitconfig.local" ]; then
  echo "Creating ~/.gitconfig.local — replace YOUR_SIGNING_KEY with your GPG key ID."
  cat > "$HOME/.gitconfig.local" << 'EOF'
[user]
	signingkey = YOUR_SIGNING_KEY
EOF
fi

./link.sh
