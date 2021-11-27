# Google Cloud SDK

BREW_PREFIX=$(brew --prefix)
source $BREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
source $BREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

gcp(){
    local readonly g=( "gcloud" "config" "configurations" )
    ${g} activate ${1:-$(${g} list |  fzf --header-lines 1 --reverse | cut -d ' ' -f 1)}
}
