# Sets the current tmux window title to either:
#  * the git repo name
#  * the current directory name
# Copied from:
# https://github.com/sei40kr/zsh-tmux-rename/blob/master/zsh-tmux-rename.plugin.zsh

rename-tmux-window() {
  [[ -z "$TMUX" ]] && return

  LANG=en_US.UTF-8 vcs_info
  if [[ -n "$vcs_info_msg_1_" ]]; then
    tmux rename-window "${vcs_info_msg_1_}"
  else
    tmux rename-window "${PWD##*/}"
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd rename-tmux-window

[[ -z "$TMUX" ]] || rename-tmux-window
