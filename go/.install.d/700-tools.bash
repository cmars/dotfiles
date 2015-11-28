#!/bin/bash

. $HOME/.bash_profile

for i in $(grep ^[^\#] $HOME/.gotools)
do
	go get -u $i
done
unset i

