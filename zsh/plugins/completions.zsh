# Load zsh-users/zsh-completions

ZSH_COMPLETIONS_ROOT=${ZSH_COMPLETIONS_ROOT:-$(brew --prefix)/share/zsh-completions}

if [ -n "$ZSH_COMPLETIONS_ROOT" ]; then
    fpath=($ZSH_COMPLETIONS_ROOT $fpath)
fi
