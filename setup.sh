#!/bin/bash

# This script setups all the symlinks that are necessary

# Absolute path to this script, e.g. /home/user/dotfiles
BASEDIR=$(dirname $(readlink -f $0))

ln -sf $BASEDIR/.bashrc $HOME/.bashrc
ln -sf $BASEDIR/.bash_profile $HOME/.bash_profile
ln -sf $BASEDIR/.gitconfig $HOME/.gitconfig
ln -sf $BASEDIR/.spacemacs $HOME/.spacemacs
