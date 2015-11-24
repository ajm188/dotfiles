function fish_prompt
    echo -n (prompt_pwd)
    set -l head (git rev-parse --abbrev-ref HEAD ^/dev/null)
    if count $head >/dev/null
        function wrap_git_branch
            echo -n '('; set_color cyan; echo -n $argv; set_color normal;
            if git diff >/dev/null
                wrap_diffstat
            else
                functions -e wrap_diffstat
            end
            echo -n ')'
            functions -e wrap_git_branch
        end

        function wrap_diffstat
            set -l diffstat (git diff --shortstat | cut -d ',' -f 2,3 | sed -e 's/^ //;s/[a-z ()]*//g' | tr ',' '\n')
            if count $diffstat >/dev/null ^/dev/null
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
            functions -e wrap_diffstat
        end

        switch $head
        case 'HEAD'
            wrap_git_branch (git rev-parse --short HEAD ^/dev/null)
        case '*'
            wrap_git_branch $head
        end
    end
    echo '> '
end
