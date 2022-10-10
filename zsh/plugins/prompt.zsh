# Customised prompt with git info

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:*' enable git

# Just show the current branch name
zstyle ':vcs_info:git*' formats '%b '

setopt PROMPT_SUBST
PROMPT='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%M:"}%{$fg_bold[green]%}${vcs_info_msg_0_}%{$reset_color%}%~> '
