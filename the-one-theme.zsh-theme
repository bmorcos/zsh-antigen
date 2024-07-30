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

function prompt_dir {
  OFFSET=60  # Leave room for time, git, commands, etc. in prompt
  MAX_DIR_LEN=$(($COLUMNS - $OFFSET))
  DIR_PREPEND="..."

  # Handle extra chars from conda env
  if [[ $PROMPT == \(* ]]; then
    # awk didn't like F'[0-9]' to split on time so settled for this
    CONDA_ENV=$(echo $PROMPT | awk -F\) '{print $1}')
    LEN_ENV=$(echo -n $CONDA_ENV | wc -m)
    MAX_DIR_LEN=$(($MAX_DIR_LEN - $LEN_ENV - 2))  # +2 for right bracket + space
  fi

  DIR=$(echo "${PWD/$HOME/~}")

  if [ $(echo -n $DIR | wc -m) -gt $MAX_DIR_LEN ]; then
    # Read in MAX_DIR_LEN chars from the pwd starting at leaf dir
    echo $DIR | rev | read -k $MAX_DIR_LEN -u 0 P_DIR

    # Drop any partial dir names from the root side and add prepend str
    P_DIR=$(echo $P_DIR | rev | sed "s/^[^\/]*\//${DIR_PREPEND}\//")
  else
    P_DIR=$DIR
  fi

  echo "$P_DIR"
}


# Handle devcon name, kubernetes, later add venv? will this conflict w conda?
function prefix {
  PREFIX=""

  # Handle kubectx (if plugin available and active context)
  # Use custom map in .zshrc to shorten context names
  if [[ "$(whence -w kubectx_prompt_info)" == *function ]] && [[ $(kubectx_prompt_info | wc -c) -gt 0 ]]; then
    PREFIX+="($(kubectx_prompt_info)"
    if [[ -n "$KNS" ]]; then
        PREFIX+=" $CYAN_NB$KNS$RESET"
    fi
    PREFIX+=") "
  fi

  echo "$PREFIX"
}


PROMPT='$(prefix)$YELLOW_NB%* $GREEN%n@%m $BLUE$(prompt_dir) $CYAN_NB$(git_prompt_info)$(git_prompt_status) $(prompt_char) $RESET'

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
