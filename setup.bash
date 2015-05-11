#!/bin/bash -ex

function install_gobrew {
	if [ ! -d "$HOME/.gobrew" ]; then
		git clone git://github.com/cryptojuice/gobrew.git $HOME/.gobrew
		(cd $HOME/.gobrew && git checkout ed893d71d9c26c472a8a59035dc99f7448b55206)
	fi
	. $HOME/dotfiles/bash/.bash_profile.d/500-gobrew.bash
	gobrew install 1.4.2 && gobrew use 1.4.2 || true
}

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

# Install gvm
install_gobrew

# Build and install some useful Go binaries
if hash go 2>/dev/null; then
	$HOME/bin/goinstallpkg

	# Install Go binaries supporting vim plugins
	vim +GoInstallBinaries +qall
else
	echo "golang not installed"
fi

# woohoo
echo "customization complete"

