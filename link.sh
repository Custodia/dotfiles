#!/bin/bash

mkdir -p ~/.gnupg ~/.config ~/.config/tmux

stow -R zsh bash git wezterm nvim tmux
