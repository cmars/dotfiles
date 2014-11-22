#!/bin/bash -ex

DIST_ID=$(lsb_release -s -i || true)
CODENAME=$(lsb_release -s -c || true)

function install_packages {
	if [[ "$DIST_ID" = "Ubuntu" && -n "$CODENAME" ]]; then
		package_files=$HOME/dotfiles/ubuntu/$CODENAME/*
		if [ -n "$package_files" ]; then
			sudo apt-get -y install --no-install-recommends $(grep -h ^[^\#] $package_files | xargs)
		fi
	fi
}

# Update packages unless this is CI
if [ -z "$TRAVIS_BUILD_ID" ]; then
	sudo apt-get update
fi

# Install bare minimum packages
sudo apt-get -y install --no-install-recommends git stow tmux vim

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

# Install more packages
install_packages

# Build and install some useful Go binaries
$HOME/bin/goinstallpkg

# woohoo
echo "customization complete"

