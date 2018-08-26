if [ -f "$HOME/.bashrc" ]; then
	. $HOME/.bashrc
fi

if [ -d "$HOME/.bash_profile.d" ]; then
	for i in $HOME/.bash_profile.d/*.bash; do
		. $i
	done
	unset i
fi

