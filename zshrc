ZBASE=$HOME/.zsh-antigen
source $ZBASE/antigen/antigen.zsh
source $ZBASE/the-one-theme.zsh-theme

setopt correct
setopt prompt_subst

#default plugins
antigen use oh-my-zsh

# Modify fast syntax highlighting theme
typeset -A FAST_HIGHLIGHT_STYLES
FAST_HIGHLIGHT_STYLES[defaultpath-to-dir]="fg=magenta,bold"

#plugins
antigen bundle git
antigen bundle command-not-found
antigen bundle extract
antigen bundle z
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle hlissner/zsh-autopair
antigen bundle RobSis/zsh-reentry-hook

# Theme
antigen theme $ZBASE "the-one-theme" --no-local-clone

# Tell antigen to use this config
antigen apply

#alias
source $HOME/.alias
