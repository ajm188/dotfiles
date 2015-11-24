function fish_right_prompt
    set -l head (git rev-parse --abbrev-ref HEAD ^/dev/null)
    if count $head >/dev/null
        function wrap_git_branch
            echo '('; set_color blue; echo $argv; set_color normal; echo ')'
            functions -e wrap_git_branch
        end

        switch $head
        case 'HEAD'
            wrap_git_branch (git rev-parse --short HEAD ^/dev/null)
        case '*'
            wrap_git_branch $head
        end
    end
end
