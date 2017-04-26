export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster" # Need a https://github.com/powerline/fonts font for this
DEFAULT_USER="mason"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load?
# (plugins can be found in ~/.oh-my-zsh/plugins/*) Custom plugins may be added
# to ~/.oh-my-zsh/custom/plugins/
#
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    cargo
    docker
    docker-compose
    git
    macports
    rvm
)

source $ZSH/oh-my-zsh.sh

# User configuration

source $HOME/.rvm/scripts/rvm

export MANPATH="/usr/local/man:$MANPATH"
export EDITOR='vim'

if [ -d "/opt/local/" ]; then
    export PATH="/opt/local/bin":"/opt/local/sbin":$PATH
    export MANPATH="/opt/local/share/man":$MANPATH
fi

local_bins=(
    .cabal
    .cargo

    bin
)
for bindir in $local_bins; do
    binpath="$HOME/$bindir"
    if [ -d $binpath ]; then
        export PATH=$binpath:$PATH
    fi
done

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
