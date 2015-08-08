# Figure out some information about our OS and package manager.
if [[ $(uname) = 'Darwin' ]]; then
  IS_MAC=1
else
  IS_LINUX=1
fi

if [[ -x `which brew` ]]; then
  HAS_BREW=1
fi

if [[ -x `which apt-get` ]]; then
  HAS_APT=1
fi

# Colors
red='\e[0;31m'
bold_red='\e[1;31m'
hi_red='\e[0;91m'
hi_bold_red='\e[1;91m'
green='\e[0;32m'
bold_green='\e[1;32m'
hi_green='\e[0;92m'
hi_bold_green='\e[1;92m'
yellow='\e[0;33m'
bold_yellow='\e[1;33m'
hi_yellow='\e[0;93m'
hi_bold_yellow='\e[1;93m'
blue='\e[0;34m'
bold_blue='\e[1;34m'
hi_blue='\e[0;94m'
hi_bold_blue='\e[1;94m'
magenta='\e[0;35m'
bold_magenta='\e[1;35m'
hi_magenta='\e[0;95m'
hi_bold_magenta='\e[1;95m'
cyan='\e[0;36m'
bold_cyan='\e[1;36m'
hi_cyan='\e[0;96m'
hi_bold_cyan='\e[1;96m'

# clean the current color
reset='\e[0m'

# Provide convenient access to a JavaScript console
alias jsc=/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc

# Set a bunch of environment variables
if [[ $IS_MAC = 1 ]]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
fi
if [[ $IS_LINUX = 1 ]]; then
  # export JAVA_HOME=???
  echo set JAVA_HOME
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f $HOME/.rvm/scripts/rvm ]; then
  . $HOME/.rvm/scripts/rvm
fi

export TERM=xterm-256color
export CLICOLOR=1
# vim is always the answer. always.
export EDITOR='vim'

# all about that prompt, no treble.
function prompt_char {
  git status >/dev/null 2>/dev/null && echo '±' && return
  echo '➜'
}

function git_sha {
  local head="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
  [ -z "$head" ] && return
  if [[ "$head" = "HEAD" ]]; then
    echo '('`git rev-parse --short HEAD`'...)'
  else
    echo '('"$head"')'
  fi
}

export PS1="\[$bold_green\]\u@\h:\[$bold_yellow\]\w \[$hi_bold_blue\]"'$(git_sha)'"\[$hi_bold_green\]"'$(prompt_char)'"\[$reset\] "
