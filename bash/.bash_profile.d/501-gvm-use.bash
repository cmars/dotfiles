# Copyright © 2016 Casey Marshall <github@cmarstech.com>
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See the COPYING file for more details.

if [ -z "$_GVM_LATEST" ]; then
	echo "_GVM_LATEST not set. Check dotfiles installation."
	exit 0
fi

if [ -f "$HOME/.gvm/scripts/gvm" ]; then
	. $HOME/.gvm/scripts/gvm
	if gvm list | grep $_GVM_LATEST; then
		gvm use $_GVM_LATEST
	else
		echo "$_GVM_LATEST not installed"
		echo "you need to run: gvm install $_GVM_LATEST"
	fi
fi
