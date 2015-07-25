# vim:ft=zsh ts=2 sw=2 sts=2

rvm_current() {
  rvm current 2>/dev/null
}

rbenv_version() {
  rbenv version 2>/dev/null | awk '{print $1}'
}

local ret_status="%(?:%{$fg_bold[green]%}⮁⮁ :%{$fg_bold[red]%}⮁⮁ %s)"

PROMPT='
%{$fg_bold[cyan]%}%n@%m %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) %{$fg_bold[cyan]%}%*%{$reset_color%}
${ret_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[white]%}⭠ "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✓"

RPROMPT='%{$fg_bold[red]%}$(rbenv_version)%{$reset_color%}'
