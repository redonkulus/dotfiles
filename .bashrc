if ! [ "$PS1" == "" ]; then
	DOT_BASHRC_LOADED=1
	! [ "$DOT_PROFILE_LOADED" == "1" ] && . ~/.profile
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.local/bin:$PATH"
