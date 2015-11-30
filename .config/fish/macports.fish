set -l port_prefix /opt/local
set -x PATH $port_prefix/bin $port_prefix/sbin $PATH
# This currently breaks man for non macports stuff, since $MANPATH is
# empty? idk...
# set -x MANPATH $port_prefix/share/man $MANPATH

function pip-bin
    set -l my_pip (port select pip | grep active | sed -e 's/[^0-9]*//g')
    port contents py$my_pip-pip | head -2 | tail -1 | sed -e 's:/[^/]*$::' | sed -e 's/ *//g'
end

set -x PATH (pip-bin) $PATH

function set-port-pip
    set -l old_pip_bin (pip-bin)
    set -l i 1
    set -l pip_bin_index
    for p in $PATH;
        switch $p
        case $old_pip_bin
            set pip_bin_index $i
        case '*'
        end
        set i (math "$i + 1")
    end
    port select pip $argv
    if test -n "$pip_bin_index"
        set PATH[$pip_bin_index] (pip-bin)
    else
        set -x PATH (pip-bin) $PATH
    end
end