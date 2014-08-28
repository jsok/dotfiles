#
# .zshrc
#
# 2007 onwards Jonathan Sokolowski
#

export ZSH=$HOME/.zsh

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

umask 022
limit coredumpsize 0

export VISUAL=vim
export EDITOR=$VISUAL

export PATH="$HOME/.bin:/usr/local/bin:/usr/local/sbin:$PATH"

# Python
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev
source /usr/local/bin/virtualenvwrapper.sh

# Ruby
export PATH=$PATH:$HOME/.rbenv/bin
if which rbenv &>/dev/null ; then
    eval "$(rbenv init - --no-rehash)"
fi

# NodeJS / NPM
[ -s "/home/jsok/.nvm/nvm.sh" ] && . "/home/jsok/.nvm/nvm.sh" # This loads nvm


# Colour support all round
autoload -U colors
colors
export CLICOLOR=1
if (grep --help 2>/dev/null |grep -- --color) >/dev/null; then
  alias grep='grep --color=auto'
fi

# ZSH Options

setopt APPEND_HISTORY
setopt AUTO_LIST
setopt AUTO_MENU
setopt AUTO_REMOVE_SLASH
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt IGNORE_EOF
setopt INTERACTIVE_COMMENTS
setopt LIST_TYPES
setopt LONG_LIST_JOBS
setopt NO_HUP
setopt RC_QUOTES

#
# History

export HISTFILE="${HOME}/.zhistory"
alias hist='fc -RI' # Import History
setopt INC_APPEND_HISTORY
unsetopt LIST_AMBIGUOUS
setopt AUTO_LIST
setopt AUTO_MENU
setopt AUTO_REMOVE_SLASH
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt EXTENDED_HISTORY
setopt INTERACTIVE_COMMENTS
setopt LIST_TYPES
setopt LONG_LIST_JOBS
setopt NO_HUP
setopt RC_QUOTES
export HISTSIZE=10000
export SAVEHIST=10000
setopt completeinword


bindkey -e
bindkey '\e[1~' beginning-of-line
bindkey '\e[2~' overwrite-mode
bindkey '\e[3~' delete-char
bindkey '\e[4~' end-of-line
bindkey '\e[5~' beginning-of-history
bindkey '\e[5~' end-of-history
bindkey '\e\e[D' backward-word
bindkey '\e\e[C' forward-word

# load our own completion functions
fpath=(~/.zsh/completion/zsh-users/src $fpath)

#
# Ad-hoc plugin system
#

# Append to plugins with: plugins=($my_plugins $plugins)
plugins=(prompt base16)

[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
[[ -f ~/.zshrc.host ]] && source ~/.zshrc.host

should_add_to_fpath() {
  local base_dir=$1
  local name=$2
  test -f $base_dir/plugins/$name/$name.zsh \
    || test -f $base_dir/plugins/$name/_$name
}

for name ($plugins); do
  if should_add_to_fpath $ZSH $name; then
    fpath=($ZSH/plugins/$name $fpath)
  fi
  source $ZSH/plugins/$name/$name.zsh
done


#
# Load completion subsystem
#
autoload -U compinit
compinit

zstyle ':completion:*' completer _expand _complete _history
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-z}={A-Z} r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select=4
