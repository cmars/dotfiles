#!/bin/bash -ex

for i in git stow; do
	dpkg -i $i 2>/dev/null || sudo apt-get install $i
done
unset i

# If this was run from a downloaded script, provision it.
if [ ! -d "$HOME/dotfiles" ]; then
	cd $HOME
	git clone https://github.com/cmars/dotfiles.git
fi

# Set up shop
modules="$*"
if [ -z "$modules" ]; then
	modules="base tmux urxvt cmars vim go"
fi
for module in $modules; do
	stow $module
done
unset module
unset modules

if [ -d "$HOME/.install.d" ]; then
  for i in $HOME/.install.d/*.bash; do
    if [ -x $i ]; then
      $i
    fi
  done
  unset i
fi

echo "customization complete"

