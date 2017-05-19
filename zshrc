source $HOME/.zsh-antigen/antigen/antigen.zsh

setopt CORRECT

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
# antigen use oh-my-zsh
antigen theme bmorcos/zsh-antigen the-one-theme

# Tell antigen to use this config
antigen apply
