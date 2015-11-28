#!/bin/bash

. $HOME/.bash_profile

for i in bzr mercurial; do
	dpkg -i $i 2>/dev/null || sudo apt-get install $i
done
unset i

for i in $(grep ^[^\#] $HOME/.gotools); do
	go get -u $i
done
unset i

