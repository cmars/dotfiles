# Copyright © 2014 Casey Marshall <github@cmarstech.com>
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See the COPYING file for more details.

if [ -f "$HOME/.gvm/scripts/gvm" ]; then
	. $HOME/.gvm/scripts/gvm
	if gvm list | grep release; then
		gvm use release
	else
		echo "go 'release' branch not installed"
		echo "you need to run: gvm install release"
	fi
fi
