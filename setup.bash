#!/bin/bash -ex

# Install bare minimum packages
sudo sh -c 'apt-get update && apt-get -y install git stow tmux vim-nox'

# If this was run from a downloaded script, provision it
if [ ! -d "$HOME/dotfiles" ]; then
	cd $HOME
	git clone https://github.com/cmars/dotfiles.git
fi

# Initialize vundle submodules
cd $HOME/dotfiles
git submodule init
git submodule update

# Set up shop
stow bash
stow vim
stow tmux
stow home

# Complete vundle install
vim +PluginInstall +qall

# TODO: go get/install commands & other stuff

# woohoo
echo "customization complete"

# launch into it
exec bash -l -c tmux
