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

sudo apt-get update

# Install bare minimum packages
sudo apt-get -y install --no-install-recommends git stow tmux vim lsb-release

# Install more packages
install_packages

