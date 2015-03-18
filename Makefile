
all: sign verify

sign:
	gpg --default-key 8DDA301A --detach-sign setup.bash

verify:
	gpg --verify setup.bash.sig

.PHONY: all

