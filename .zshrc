# Exports
export EDITOR=vim
typeset -U path                      # drop duplicate PATH entries
path=("$HOME/.local/bin" $path)

# Aliases
alias ezsh='vim ~/.zshrc && source ~/.zshrc'
alias ls='ls -al'

# Dreamhost SSH
alias ssb='ssh bertalotto.net'
alias sct='ssh customertrackr.com'

# Completion (includes git; replaces the bash git-completion script)
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # case-insensitive
setopt NO_LIST_AMBIGUOUS             # list matches on first Tab

# History: Up/Down search entries starting with what you've typed.
# Ex: history contains (ls, pwd, echo "foo", ps aux)
# type: p(UP) --> scrolls through "ps aux" and "pwd", skips echo and ls.
# Use ctrl-P and ctrl-N to walk through history the default way.
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search
setopt HIST_IGNORE_DUPS SHARE_HISTORY

# Prompt: time, git branch, working dir   e.g.  1:18PM (main) ~/Dev $
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats ' (%b)'
zstyle ':vcs_info:git:*' actionformats ' (%b|%a)'
precmd() { vcs_info }
setopt PROMPT_SUBST
PROMPT='%t${vcs_info_msg_0_} %~ %# '

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"                   # loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" # tab completion (works in zsh)
