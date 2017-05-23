BLUE="%{$fg_bold[blue]%}"
BLUE_NB="%{$fg_no_bold[blue]%}"
CYAN_NB="%{$fg_no_bold[cyan]%}"
GREEN="%{$fg_bold[green]%}"
GREEN_NB="%{$fg_no_bold[green]%}"
RED_NB="%{$fg_no_bold[red]%}"
RESET="%{$reset_color%}"
YELLOW_NB="%{$fg_no_bold[yellow]%}"
MAGENTA_NB="%{$fg_no_bold[magenta]%}"

#different char if root
function prompt_char {
    if [ $UID -eq 0 ]; then echo "$RED_NB√"; else echo "$BLUE_NB∴"; fi
}

function get_pwd() {
  echo "${PWD/$HOME/~}"
}

PROMPT='$YELLOW_NB%* $GREEN%n@%m $BLUE$(get_pwd) $CYAN_NB$(git_prompt_info)$(git_prompt_status) $(prompt_char) $RESET'

# git settings
ZSH_THEME_GIT_PROMPT_ADDED="$MAGENTA_NB+"
ZSH_THEME_GIT_PROMPT_AHEAD="$GREEN_NB↑"
ZSH_THEME_GIT_PROMPT_CLEAN="$GREEN_NB≡"
ZSH_THEME_GIT_PROMPT_DELETED="$RED_NB×"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_DIVERGED="$MAGENTA_NB←→"
ZSH_THEME_GIT_PROMPT_MODIFIED="$YELLOW_NB*"
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_BEHIND="$RED_NB↓"
ZSH_THEME_GIT_PROMPT_UNMERGED="$RED_NB→←"
ZSH_THEME_GIT_PROMPT_UNTRACKED="$YELLOW_NB?"
ZSH_THEME_GIT_PROMPT_STASHED="$CYAN_NB•"
