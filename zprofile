# tmux insists on starting a login shell, irrespective of default-shell and
# default-command.
# Due to this behaviour and the default MacOS /etc/zprofile which calls
# path_helper, any existing PATH will be re-ordered.
# Clearing PATH re-sourcing causing the PATH to be constructed from scratch
# again.
if [[ -f /etc/zprofile  && -n "$TMUX" ]]; then
    PATH=""
    source /etc/zprofile
fi
