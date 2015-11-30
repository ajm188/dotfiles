if test -e /opt/local/
    source $HOME/.config/fish/macports.fish
end

if test -e $HOME/bin/
    set -x PATH $HOME/bin $PATH
end

# This doesn't actually have to be here, but since I'm sharing my config,
# I'll leave it here.
set -U EDITOR vim
set -U fish_user_abbreviations 'g=git' 'v=vim' 'e=emacs'
