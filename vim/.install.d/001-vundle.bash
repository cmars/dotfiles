#!/bin/bash

# Initialize vundle submodules
cd $HOME/dotfiles
git submodule init
git submodule update

# Complete vundle install
vim +PluginInstall +qall

