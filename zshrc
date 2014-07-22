#
# .zshrc
#
# 2007 onwards Jonathan Sokolowski
#

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

umask 022
limit coredumpsize 0

git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo " %{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}"
  fi
}
setopt promptsubst
export PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%M:"}%{$fg_bold[blue]%}%n@%M%{$reset_color%}$(git_prompt_info) %~> '

export VISUAL=vim
export EDITOR=$VISUAL

export PATH="$HOME/.bin:/usr/local/bin:/usr/local/sbin:$PATH"

# Python
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev
source /usr/local/bin/virtualenvwrapper.sh

# go-lang
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
source /usr/local/go/misc/zsh/go

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

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# Load completiona subsystem
autoload -U compinit
compinit

zstyle ':completion:*' completer _expand _complete _history
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-z}={A-Z} r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select=4


[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
[[ -f ~/.zshrc.host ]] && source ~/.zshrc.host
