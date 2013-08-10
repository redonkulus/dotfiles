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

# Setting up SSH agent
# @see http://mah.everybody.org/docs/ssh
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi

