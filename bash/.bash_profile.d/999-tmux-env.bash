# Copyright © 2014 Casey Marshall <github@cmarstech.com>
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See the COPYING file for more details.

for var in $(tmux show-environment 2>/dev/null | grep -v "^-"); do
	eval "export $var"
done
