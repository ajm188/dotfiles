export PATH=$HOME/bin:/usr/local/bin:$PATH

ssh-add -K 2>/dev/null

export TERM="xterm-256color"
export DOTFILES_ROOT=$HOME/work/dotfiles

ZSH_THEME="powerlevel10k/powerlevel10k" # Need a https://github.com/powerline/fonts font for this

function new_joke() { export DAD_JOKE="$(curl -s https://icanhazdadjoke.com)" }

source "${DOTFILES_ROOT}/.p10k.zsh"
unset POWERLEVEL9K_CONTEXT_DEFAULT_CONTENT_EXPANSION

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
    brew
    cargo
    docker
    docker-compose
    git
    macports
)

# Set up fpath for custom completions prior to compinit
custom_completions=(
)
for completion in $custom_completions; do
    compdir="$HOME/$completion"
    if [ -d $compdir ]; then
        fpath=($compdir $fpath)
    fi
done
unset completion

export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"
export EDITOR='vim'

if [ -d "/opt/local/" ]; then
    export PATH="/opt/local/bin":"/opt/local/sbin":$PATH
    export MANPATH="/opt/local/share/man":$MANPATH
fi

export GOPATH=$HOME/work/go
export PATH=$PATH:$GOPATH/bin

local_bins=(
    .cabal/bin
    .cargo/

    dev/go/bin

    bin
    .local/bin
)
for bindir in $local_bins; do
    binpath="$HOME/$bindir"
    if [ -d $binpath ]; then
        export PATH=$binpath:$PATH
    fi
done
unset bindir

export DOTFILES_ROOT=$HOME/dotfiles

export GOTO_PROJECT_DIR=$HOME
source $DOTFILES_ROOT/.zsh/goto.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gp='git push origin HEAD'
alias gpp='git push --force-with-lease origin HEAD'
alias gpt='gp --tags'
alias gg='git grep'

which_tmux=$(which tmux)
alias tmux="$which_tmux -CC"

alias reload='source ~/.zshrc'
alias fix-ssh='export $(tmux show-environment | grep \^SSH_AUTH_SOCK=)'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if (which rg >/dev/null); then
    alias rgg='rg --hidden -g \!.git'
    export FZF_DEFAULT_COMMAND='rg --hidden -g \!.git -l ""'
fi

export SMAN_APPEND_HISTORY=false
export SMAN_SNIPPET_DIR="$DOTFILES_ROOT/sman/"
export SMAN_EXEC_CONFIRM=false
export SMAN_LS_COLOR_FILES=1,4,35
[ -f $GOPATH/src/github.com/tokozedg/sman/sman.rc ] && source $GOPATH/src/github.com/tokozedg/sman/sman.rc

alias v='vim $(fzf)'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

which nvm >/dev/null 2>&1 && nvm use 14.15.3

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/openjdk@15/bin:$PATH"
export CDPATH="$CDPATH:$HOME/work"
