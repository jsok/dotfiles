# Sets the current tmux window title to either:
#  * the git repo name
#  * the current directory name

tmux_title() {
    if [[ "$TMUX" != "" ]]; then
        TMUX_TITLE=""
        if [ git rev-parse --is-inside-work-tree >/dev/null 2>&1 == "true" ]; then
            TMUX_TITLE=$(basename `git rev-parse --show-toplevel`)
        else
            TMUX_TITLE=$(basename `pwd`)
        fi
        tmux rename-window "$TMUX_TITLE"
    fi
}

precmd_functions=(${precmd_functions[@]} "tmux_title")
