#!/usr/bin/env zsh

git_status() {
  local dirty
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    dirty=$(parse_git_dirty)
    if [[ -n $dirty ]]; then
      echo " %{$fg[yellow]%}$(git_prompt_info)"
    else
      echo " %{$fg[green]%}$(git_prompt_info)"
    fi
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" ±"

PROMPT='[%{$fg[blue]%}%2~%{$reset_color%}$(git_status)%{$reset_color%}] '
