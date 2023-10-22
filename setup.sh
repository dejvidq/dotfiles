#!/bin/bash

# Neovim
[[ -d ~/.config ]] || mkdir -p ~/.config
sudo ln -s "$(pwd)/nvim" ~/.config/nvim

sudo ln -s "$(pwd)/tmux/.tmux.conf" ~/.tmux.conf

sudo ln -s "$(pwd)/linux/.inputrc" ~/.inputrc
sudo ln -s "$(pwd)/linux/aliases" ~/.bash_aliases
