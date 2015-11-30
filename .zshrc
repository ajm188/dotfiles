export EDITOR=vim

fpath=(/usr/local/share/zsh-completions $fpath)

[[ -s "$HOME"/.rvm/scripts/rvm ]] && source "$HOME/.rvm/scripts/rvm"
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=$MANPATH:/opt/local/share/man

setopt PROMPT_SUBST

function set_prompt() {
    local head="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
    local branch=''
    local info=''
    local venv=''
    if [ -z "$head" ]; then
        info='[%*]'
    else
        if [[ "$head" = "HEAD" ]]; then
            head="$(git rev-parse --short HEAD 2> /dev/null || echo '')"
        fi
        branch="($head)"
        local commit_time="$(git log -1 --pretty=format:%ar 2> /dev/null || echo '%*')"
        info="[$commit_time]"
    fi
    [ -n "$VIRTUAL_ENV" ] && venv="(${VIRTUAL_ENV/[^ ]*\//})"
    PROMPT="$venv%c$branch \$ "
    RPROMPT="$info"
}

typeset -ga precmd_functions
precmd_functions+='set_prompt'
