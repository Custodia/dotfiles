#!/bin/bash

mkdir -p ~/.gnupg ~/.config ~/.config/tmux ~/.config/git

stow -R zsh bash git wezterm nvim tmux
