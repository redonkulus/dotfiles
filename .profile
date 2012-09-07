#DOT_PROFILE_LOADED=1
#if [ -n "$BASH_VERSION" ]; then
#	[ -f ~/.bashrc ] && ! [ "$DOT_BASHRC_LOADED" == "1" ] && . ~/.bashrc
#	[ -f ~/.extra.bashrc ] && . ~/.extra.bashrc
#fi

# Exports
export EDITOR=vim
export GIT_SSL_NO_VERIFY=true
export PATH=/home/y/bin:$HOME/local/node/bin:$PATH

# Aliases
alias debugsafari='export CA_COLOR_OPAQUE=1; export CA_LOG_MEMORY_USAGE=1; /Applications/Safari.app/Contents/MacOS/Safari'
alias ebash='vim ~/.bash_profile && source ~/.bash_profile'
alias fixvpn='sudo kextload /System/Library/Extensions/CiscoVPN.kext'
alias hut='cd /Volumes/sbertal/'
alias itunesbackup='defaults write com.apple.iTunes DeviceBackupsDisabled -bool'
alias ls='ls -al'
alias yran='ssh randiscover.corp.yahoo.com'

# Git
source .git-completion
gitshell=
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

is_git=`which git | wc -l`
if [ "$is_git" -gt "0" ]; then
    gitshell="\$(parse_git_branch)"
fi

# Change prompt to include yroot name
PS1="\@$gitshell \w \$ "

