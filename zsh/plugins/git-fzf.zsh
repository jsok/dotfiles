#!/usr/bin/env zsh

# quickly cd into a git repository
DEV_DIR=${DEV_DIR:-"$HOME/dev/github.com"}
repo() {
    local d=$(find "$DEV_DIR" -maxdepth 3 -name .git -type d -prune -exec dirname {} \; | fzf --tiebreak=length,end)
    [ -n "${d}" ] && cd "$d"
}

# git branch and checkout which utilise fzf:
# https://polothy.github.io/post/2019-08-19-fzf-git-checkout/

fzf-git-branch() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    git branch --color=always --all |
        grep -v HEAD |
        fzf --ansi --no-multi --preview-window right:65% --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
        sed "s/.* //"
}

fzf-git-checkout() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    local branch

    branch=$(fzf-git-branch)
    if [[ -z "$branch" ]]; then
        echo "No branch selected."
        return
    fi

    # If branch name starts with 'remotes/' then it is a remote branch. By
    # using --track and a remote branch name, it is the same as:
    # git checkout -b branchName --track origin/branchName
    if [[ "$branch" = 'remotes/'* ]]; then
        git checkout --track "$branch"
    else
        git checkout "$branch";
    fi
}

alias gco="fzf-git-checkout"
