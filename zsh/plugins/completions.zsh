# Load zsh-users/zsh-completions

ZSH_SITE_FUNCTIONS=${ZSH_SITE_FUNCTIONS:-$(brew --prefix)/share/zsh/site-functions}

if [ -n "$ZSH_SITE_FUNCTIONS" ]; then
    fpath=($ZSH_SITE_FUNCTIONS $fpath)
fi

ZSH_COMPLETIONS_ROOT=${ZSH_COMPLETIONS_ROOT:-$(brew --prefix)/share/zsh-completions}

if [ -n "$ZSH_COMPLETIONS_ROOT" ]; then
    fpath=($ZSH_COMPLETIONS_ROOT $fpath)
fi
