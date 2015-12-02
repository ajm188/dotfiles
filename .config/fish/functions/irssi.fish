function __fish_tmux_has_irssi_session
    set -l irssi_session (tmux ls ^/dev/null | grep irssi)
    test -n "$irssi_session"
end

function irssi
    if which tmux >/dev/null
        if test -n "$TMUX"
            if not __fish_tmux_has_irssi_session
                echo "Cannot create new session inside of a tmux session."
                echo "Please detach from tmux and try again."
                return 1
            end
            tmux switch -t irssi
        else
            if not __fish_tmux_has_irssi_session
                tmux new-session -d -s irssi
                tmux send-keys -t irssi 'command irssi' C-m
            end
            tmux attach -t irssi
        end
    else
        command irssi
    end
end
