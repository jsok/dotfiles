# Customised prompt with git info
setopt PROMPT_SUBST
PROMPT='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%M:"}%{$fg_bold[green]%}${vcs_info_msg_0_}%{$reset_color%}%~%{$fg_bold[green]%}>%{$reset_color%} '
