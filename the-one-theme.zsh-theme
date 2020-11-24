BLUE="%{$fg_bold[blue]%}"
BLUE_NB="%{$fg_no_bold[blue]%}"
CYAN_NB="%{$fg_no_bold[cyan]%}"
CYAN="%{$fg_bold[cyan]%}"
GREEN="%{$fg_bold[green]%}"
GREEN_NB="%{$fg_no_bold[green]%}"
RED_NB="%{$fg_no_bold[red]%}"
RED="%{$fg_bold[red]%}"
RESET="%{$reset_color%}"
YELLOW_NB="%{$fg_no_bold[yellow]%}"
MAGENTA_NB="%{$fg_no_bold[magenta]%}"
MAGENTA="%{$fg_bold[magenta]%}"

#different char if root
function prompt_char {
    if [ $UID -eq 0 ]; then
        echo "$RED√"
    elif [[ -n $SSH_CONNECTION ]]; then
        echo "$CYAN∵"
    else
        echo "$MAGENTA∴"
    fi
}

function get_pwd() {
  echo "${PWD/$HOME/~}"
}

PROMPT='$YELLOW_NB%* $GREEN%n@%m $BLUE$(get_pwd) $CYAN_NB$(git_prompt_info)$(git_prompt_status) $(prompt_char) $RESET'

# git settings
ZSH_THEME_GIT_PROMPT_ADDED="$MAGENTA_NB+"
ZSH_THEME_GIT_PROMPT_AHEAD="$GREEN_NB↑"
ZSH_THEME_GIT_PROMPT_CLEAN="$GREEN_NB≡ "
ZSH_THEME_GIT_PROMPT_DELETED="$YELLOW_NB×"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_DIVERGED="$RED_NB←→"
ZSH_THEME_GIT_PROMPT_MODIFIED="$RED_NB*"
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_BEHIND="$RED_NB↓"
ZSH_THEME_GIT_PROMPT_UNMERGED="$RED_NB→←"
ZSH_THEME_GIT_PROMPT_UNTRACKED="$YELLOW_NB?"
ZSH_THEME_GIT_PROMPT_STASHED="$CYAN_NB•"
ZSH_THEME_GIT_PROMPT_RENAMED="$MAGENTA_NB‣"

# Show error code in right prompt, if any
function exit_code_prompt() {
  local EXIT_CODE=$?
  if [[ $EXIT_CODE -ne 0 ]]; then
    echo "%{$fg_bold[red]%}$EXIT_CODE%{$reset_color%}"
  fi
}

RPROMPT='$(exit_code_prompt)'
