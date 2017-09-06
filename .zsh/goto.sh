function goto() {
    local project="$1"

    [[ $(tmux has -t $project 2>/dev/null) ]] || _tmux_create $project
    _tmux_attach $project
}

function _tmux_create() {
    local project="$1"
    local base=$GOTO_PROJECT_DIR
    [ -n $GOTO_PROJECT_DIR ] || local base=$HOME

    local workdir="$base/$project"
    tmux new -d -s $project -c $workdir
}

function _tmux_attach() {
    local project="$1"

    if [ -n $TMUX ]; then
        tmux switch -t $project
    else
        tmux attach -t $project
    fi
}
