ZBASE=$HOME/.zsh-antigen
source $ZBASE/antigen/antigen.zsh

# Default to prezto packages
antigen use prezto

# Modules
antigen bundle sorin-ionescu/prezto modules/helper  # required for Git module (according to antigen)
antigen bundle sorin-ionescu/prezto modules/environment # default module in prezto
antigen bundle sorin-ionescu/prezto modules/terminal # default module in prezto
antigen bundle sorin-ionescu/prezto modules/editor # default module in prezto
antigen bundle sorin-ionescu/prezto modules/history # default module in prezto
antigen bundle sorin-ionescu/prezto modules/directory # default module in prezto
antigen bundle sorin-ionescu/prezto modules/spectrum # default module in prezto
antigen bundle sorin-ionescu/prezto modules/utility # default module in prezto
antigen bundle sorin-ionescu/prezto modules/completion # default module in prezto
antigen bundle sorin-ionescu/prezto modules/prompt # default module in prezto
antigen bundle sorin-ionescu/prezto modules/archive
antigen bundle sorin-ionescu/prezto modules/git
antigen bundle sorin-ionescu/prezto modules/history-substring-search
antigen bundle sorin-ionescu/prezto modules/syntax-highlighting

# Theme
# antigen use oh-my-zsh
antigen theme --loc=$ZBASE/the-one-theme.zsh-theme

# Tell antigen to use this config
antigen apply
