#!/bin/bash -ex

function install_packages {
	DIST_ID=$(bash -c 'lsb_release -s -i | tr [A-Z] [a-z]' || true)
	CODENAME=$(lsb_release -s -c || true)

	if [[ -n "$DIST_ID" && -n "$CODENAME" ]]; then
		package_files=$HOME/dotfiles/$DIST_ID/$CODENAME/*
		if [ -n "$package_files" ]; then
			sudo apt-get -y install --no-install-recommends $(grep -h ^[^\#] $package_files | xargs)
		fi
	fi
}

function install_gobrew {
	if [ ! -d "$HOME/.gobrew" ]; then
		git clone git://github.com/cryptojuice/gobrew.git $HOME/.gobrew
		(cd $HOME/.gobrew && git checkout ed893d71d9c26c472a8a59035dc99f7448b55206)
	fi
}

# Update packages unless this is CI
if [ -z "$TRAVIS_BUILD_ID" ]; then
	sudo apt-get update
fi

# Install bare minimum packages
sudo apt-get -y install --no-install-recommends git stow tmux vim lsb-release

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

# Install gvm
install_gobrew

# Build and install some useful Go binaries
if hash go 2>/dev/null; then
	$HOME/bin/goinstallpkg
else
	echo "golang not installed"
fi

# woohoo
echo "customization complete"

