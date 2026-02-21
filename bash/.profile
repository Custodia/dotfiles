#!/bin/sh

# Common configurations shared across all shells (bash, zsh, sh)
# Sourced via .zshenv for zsh and .bash_profile for bash

# Setup brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Set nvim as the default editor
export EDITOR="nvim"

# Make fzf use ripgrep (respects .gitignore, includes hidden files)
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob="!.git"'

# Load nvm (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
