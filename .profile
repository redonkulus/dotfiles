# Exports
export EDITOR=vim
export PATH=$HOME/.local/bin:/Applications/MAMP/bin/php/php8.4.17/bin:/usr/local/mysql/bin/:/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.2.0/bin:$HOME/local/node/bin:$PATH

# Aliases
alias debugsafari='export CA_COLOR_OPAQUE=1; export CA_LOG_MEMORY_USAGE=1; /Applications/Safari.app/Contents/MacOS/Safari'
alias ebash='vim ~/.bash_profile && source ~/.bash_profile'
alias fixvpn='sudo kextload /System/Library/Extensions/CiscoVPN.kext'
alias hut='cd /Volumes/sbertal/'
alias itunesbackup='defaults write com.apple.iTunes DeviceBackupsDisabled -bool'
alias ls='ls -al'
alias yran='ssh randiscover.corp.yahoo.com'

# Dreamhost SSH
alias ssb='ssh bertalotto.net'
alias sct='ssh customertrackr.com'

# MacFuse
alias osb='sshfs sbertalo@bertalotto.net:/home/sbertalo/ ~/Dev/mounts/sb'
alias csb='umount -f ~/Dev/mounts/sb'
alias omidi='sshfs mididelight@mididelight.com:/home/mididelight/ ~/Dev/mounts/md'
alias cmidi='umount -f ~/Dev/mounts/md'
alias oct='sshfs customertrackr@customertrackr.com:/home/customertrackr/ ~/Dev/mounts/ct'
alias cct='umount -f ~/Dev/mounts/ct'

# Git
source ~/Dev/redonkulus/dotfiles/.git-completion
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

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" # nvm tab completion
