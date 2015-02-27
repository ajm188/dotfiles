function prompt_char {
  git branch >/dev/null 2>/dev/null && echo '±' && return
  hg root >/dev/null 2>/dev/null && echo '☿' && return
  echo '➜'
}

function box_name {
  [ -f ~/.box_name ] && cat ~/.box_name || hostname -s
}

autoload -U colors && colors

GIT_PROMPT_SYMBOL="%{$fg[blue]%}±"
GIT_PROMPT_PREFIX="%{$fg[green]%} [%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$fg_bold[blue]%}?%{$reset_color%}"
GIT_PROMPT_MODIFIED="%{$fg_bold[red]%}✗%{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg_bold[green]%}✓%{$reset_color%}"

function parse_git_branch {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

function parse_git_state {
  local GIT_STATE=''

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ $NUM_AHEAD -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ $NUM_BEHIND -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi

  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi

  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi
}

function git_prompt_string {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo " %{$fg[blue]%}git:(${PR_BOLD_RED}${git_where#(refs/heads/|tags/)}%{$fg[blue]%})$(parse_git_state)%{$reset_color%}"
}

function parse_hg_branch {
  hg branch 2> /dev/null
}

function parse_hg_state {
  local HG_STATE=''

  # Just reuse the git states
  if [[ -n $(hg status -u 2> /dev/null) ]]; then
    HG_STATE=$HG_STATE$GIT_PROMPT_UNTRACKED
  fi

  if [[ -n $(hg status -m 2> /dev/null) ]]; then
    HG_STATE=$HG_STATE$GIT_PROMPT_MODIFIED
  fi

  if [[ -n $(hg status -a 2> /dev/null) ]]; then
    HG_STATE=$HG_STATE$GIT_PROMPT_STAGED
  fi

  if [[ -n $HG_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$HG_STATE$GIT_PROMPT_SUFFIX"
  fi
}

function hg_prompt_string {
  local hg_where="$(parse_hg_branch)"
  [ -n "$hg_where" ] && echo " %{$fg[blue]%}hg:(${PR_BOLD_RED}${hg_where}%{$fg[blue]%})$(parse_hg_state)%{$reset_color%}"
}

function current_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

PROMPT='
${PR_GREEN}%n@$(box_name)%{$reset_color%}${PR_BOLD_WHITE}:%{$reset_color%}${PR_BOLD_YELLOW}$(current_pwd)%{$reset_color%}$(git_prompt_string)$(hg_prompt_string)$(prompt_char) '
