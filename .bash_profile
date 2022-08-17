#!/bin/bash

# .bash_profile is for code that should only
# be executed when using interactive login shell.

# Also load all code thats executed for interactive non-login shells
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
