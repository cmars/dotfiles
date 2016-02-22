#!/bin/bash -ex

HERE=$(cd $(dirname "$0"); pwd)

cd ${HOME}
git clone https://github.com/cmars/tools.git
${HOME}/tools/install.bash

cd ${HERE}

# Initialize vundle submodules
git submodule init
git submodule update

# Set up shop
stow bash
stow vim
stow tmux
stow home
stow urxvt

# Complete vundle install
vim +PluginInstall +qall

