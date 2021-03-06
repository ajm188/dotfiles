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

function _tmux_ls() {
    local sessions=$(tmux ls 2>/dev/null | cut -d ':' -f1)
    [[ -z $sessions ]] && return 0
    echo "$sessions"
}

function _sessions_comp() {
    echo '"sessions:custom sessions:($(_tmux_ls read -d 0 -A))"'
}

function _projects_comp() {
    echo '"files:filenames:_files -W $(_goto_base_dir)"'
}

compdef "_alternative $(_sessions_comp) $(_projects_comp)" goto
