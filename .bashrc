if ! [ "$PS1" == "" ]; then
	DOT_BASHRC_LOADED=1
	! [ "$DOT_PROFILE_LOADED" == "1" ] && . ~/.profile
fi

export PATH="$HOME/.local/bin:$PATH"
