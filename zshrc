ZBASE=$HOME/.zsh-antigen
source $ZBASE/antigen/antigen.zsh

setopt correct
setopt prompt_subst

#default plugins
antigen use oh-my-zsh

#plugins
antigen bundle git
antigen bundle command-not-found
antigen bundle extract
antigen bundle z
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle hlissner/zsh-autopair

# Theme
antigen theme $ZBASE "the-one-theme" --no-local-clone

# Tell antigen to use this config
antigen apply

#alias
source $HOME/.alias
