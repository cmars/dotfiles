#!/bin/bash -ex

HERE=$(cd $(dirname "$0"); pwd)

cd ${HERE}

sudo apt-get install -y git stow vim tmux

# Initialize vundle submodules
git submodule init
git submodule update

# Set up shop
for mod in bash git home tmux vim; do
	stow -t $HOME $mod
done

# Complete vundle install
vim +PluginInstall +qall

