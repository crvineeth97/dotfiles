#!/bin/bash

# Install GNU Stow
sudo apt-get update
sudo apt-get install -y stow

# Run stow to symlink dotfiles
stow .
