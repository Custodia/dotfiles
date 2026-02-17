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

# Create local git config if it doesn't exist
if [ ! -f "$HOME/.gitconfig.local" ]; then
  echo "Creating ~/.gitconfig.local — replace YOUR_SIGNING_KEY with your GPG key ID."
  cat > "$HOME/.gitconfig.local" << 'EOF'
[user]
	signingkey = YOUR_SIGNING_KEY
EOF
fi

./link.sh

# Install TPM (tmux plugin manager) if not already installed
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  echo "TPM installed. Open tmux and press C-Space + I to install plugins."
fi
