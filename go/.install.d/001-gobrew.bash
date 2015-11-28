#!/bin/bash

if [ ! -d "$HOME/.gobrew" ]; then
	git clone git://github.com/cmars/gobrew.git $HOME/.gobrew
else
	(cd $HOME/.gobrew; git checkout master; git pull origin master)
fi

export PATH="$HOME/.gobrew/bin:$PATH"
eval "$(gobrew init -)"

latest=$(gobrew list | tail -1)
if [ ! -d "$HOME/.gobrew/versions/$latest" ]; then
	gobrew install $latest
fi

gobrew use $latest

