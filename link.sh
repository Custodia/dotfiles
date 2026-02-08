#!/bin/bash

BASEDIR=$(dirname $(readlink -f $0))

# Function to create symlink if it doesn't already exist
link_if_needed() {
  local source=$1
  local dest=$2

  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$source" ]; then
    # Already linked correctly, skip
    :
  else
    echo "Linking $dest -> $source"
    ln -sf "$source" "$dest"
  fi
}

link_if_needed "$BASEDIR/.zshrc" "$HOME/.zshrc"
link_if_needed "$BASEDIR/.zprofile" "$HOME/.zprofile"
link_if_needed "$BASEDIR/.gitconfig" "$HOME/.gitconfig"
link_if_needed "$BASEDIR/.config" "$HOME/.config"
link_if_needed "$BASEDIR/.gnupg/gpg-agent.conf" "$HOME/.gnupg/gpg-agent.conf"
