export EDITOR=vim

setopt PROMPT_SUBST

function git_branch() {
    local head="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
    [ -z "$head" ] && return
    if [[ "$head" = "HEAD" ]]; then
        head="$(git rev-parse --short HEAD 2> /dev/null)"
        [ -z "$head" ] && return
    fi
    echo '('"$head"')'
}

function git_info() {
    local head="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
    if [[ -z "$head" ]]; then
        echo '[%*]' && return
    fi
    echo $(git_modified) $(git_staged) $(git_untracked) $(git_commit_time)
}

function git_commit_time() {
    local commit_time="$(git log -1 --pretty=format:%ar)"
    echo '['"$commit_time"']'
}

git_modified() {
}

git_staged() {
}

git_untracked() {
}

function set_prompt() {
    PROMPT="%c$(git_branch) \$ "
    RPROMPT="$(git_info)"
}

typeset -ga precmd_functions
precmd_functions+='set_prompt'
