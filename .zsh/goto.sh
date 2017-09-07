function goto() {
    local project="$1"

    [[ -z $(tmux has -t $project 2>&1) ]] || _tmux_create $project
    _tmux_attach $project
}

function _tmux_create() {
    local project="$1"
    local base=$(_goto_base_dir)

    local workdir="$base/$project"
    tmux new -d -s $project -c $workdir
}

function _tmux_attach() {
    local project="$1"

    if [[ -n $TMUX ]]; then
        tmux switch -t $project
    else
        tmux attach -t $project
    fi
}

function _goto_base_dir() {
    [[ -n $GOTO_PROJECT_DIR ]] && echo "$GOTO_PROJECT_DIR" && return 0
    echo "$HOME"
}

compdef '_files -W $GOTO_PROJECT_DIR/' goto
