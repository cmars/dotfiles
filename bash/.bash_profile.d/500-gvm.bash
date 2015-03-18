# Copyright © 2014 Casey Marshall <github@cmarstech.com>
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See the COPYING file for more details.

LATEST=go1.4

if [ -f "$HOME/.gvm/scripts/gvm" ]; then
	. $HOME/.gvm/scripts/gvm
	if gvm list | grep $LATEST; then
		gvm use $LATEST
	else
		echo "$LATEST not installed"
		echo "you need to run: gvm install $LATEST"
	fi
fi
