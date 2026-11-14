# Exports
export EDITOR=vim
export PATH=$HOME/.local/bin:$PATH
export BASH_SILENCE_DEPRECATION_WARNING=1  # hide macOS "default shell is now zsh" notice

# Aliases
alias ebash='vim ~/.profile && source ~/.profile'
alias ls='ls -al'

# Dreamhost SSH
alias ssb='ssh bertalotto.net'
alias sct='ssh customertrackr.com'

# Git
# Use the completion script that ships with the installed git
GIT_COMPLETION=/Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
[ -f "$GIT_COMPLETION" ] && . "$GIT_COMPLETION"
gitshell=
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

is_git=`which git | wc -l`
if [ "$is_git" -gt "0" ]; then
    gitshell="\$(parse_git_branch)"
fi

# Prompt: time, git branch, working dir
PS1="\@$gitshell \w \$ "

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" # nvm tab completion
