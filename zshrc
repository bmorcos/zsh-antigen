ZBASE=/home/ben/.zsh-antigen
source $ZBASE/antigen/antigen.zsh

setopt correct

#default plugins
antigen use oh-my-zsh

#plugins
antigen bundle git
antigen bundle command-not-found
antigen bundle extract
antigen bundle z
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

# Theme
antigen theme $ZBASE "the-one-theme" --no-local-clone

# Tell antigen to use this config
antigen apply

alias diff="colordiff"
alias go="gnome-open"

export PATH="/home/ben/anaconda3/bin:$PATH"
