if test -e /opt/local/
    source $HOME/.config/fish/macports.fish
end

# This doesn't actually have to be here, but since I'm sharing my config,
# I'll leave it here.
set -U EDITOR vim
set -U fish_user_abbreviations 'g=git'
set -U fish_user_abbreviations $fish_user_abbreviations 'v=vim'
set -U fish_user_abbreviations $fish_user_abbreviations 'ec=emacsclient -a \'\''
set -U fish_user_abbreviations $fish_user_abbreviations 'ed=emacs --daemon'
set -U fish_user_abbreviations $fish_user_abbreviations 'ke=killall emacs'
set -U fish_user_abbreviations $fish_user_abbreviations 'gits=git s'
set -U fish_user_abbreviations $fish_user_abbreviations 'gi=git init'
set -x GOPATH $HOME/dev/go
set -x GOBIN $GOPATH/bin
set -x PATH $PATH $GOBIN

if test -e $HOME/bin/
    set -x PATH $HOME/bin $PATH
end

if test -e $HOME/.cabal/bin/
    set -x PATH $HOME/.cabal/bin $PATH
end

rvm default
