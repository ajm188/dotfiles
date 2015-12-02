function __fish_prompt_wrap_git_branch
    echo -n '('; set_color cyan; echo -n $argv; set_color normal;
    if git diff >/dev/null ^/dev/null
        __fish_prompt_wrap_diffstat
    end
    echo -n ')'
end

function __fish_prompt_wrap_diffstat
    set -l diffstat (git diff --shortstat | cut -d ',' -f 2,3 | sed -e 's/^ //;s/[a-z ()]*//g' | tr ',' '\n')
    if test -n "$diffstat"
        echo -n ' - '
        for s in $diffstat
            set -l op (echo $s | sed -E 's/.*(.)/\1/')
            switch $op
            case '+'
                set_color green
            case '-'
                set_color red
            case '*'
            end
            echo -n $s
            set_color normal
        end
    end
end

function fish_prompt
    echo -n (prompt_pwd)
    set -l head (git rev-parse --abbrev-ref HEAD ^/dev/null)

    switch "$head"
    case 'HEAD'
        __fish_prompt_wrap_git_branch (git rev-parse --short HEAD ^/dev/null)
    case ''
    case '*'
        __fish_prompt_wrap_git_branch $head
    end
    echo '> '
end
