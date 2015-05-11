# Copyright © 2014 Casey Marshall <github@cmarstech.com>
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See the COPYING file for more details.

if [ -z "$GOPATH" ]; then
	export GOPATH=$HOME/gocode
	mkdir -p $GOPATH/src
	export PATH=$GOPATH/bin
fi
