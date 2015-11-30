if test -e /opt/local/
    set -l port_prefix /opt/local
    set -x PATH $port_prefix/bin $port_prefix/sbin $PATH
    # This currently breaks man for non macports stuff, since $MANPATH is
    # empty? idk...
    # set -x MANPATH $port_prefix/share/man $MANPATH
end

if test -e $HOME/bin/
    set -x PATH $HOME/bin $PATH
end

# This doesn't actually have to be here, but since I'm sharing my config,
# I'll leave it here.
set -U EDITOR vim
set -U fish_user_abbreviations 'g=git' 'v=vim' 'e=emacs'
