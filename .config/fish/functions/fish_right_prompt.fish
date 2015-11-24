function fish_right_prompt
    set -l head (git rev-parse --abbrev-ref HEAD ^/dev/null)
    function wrap_time
        echo '['; set_color yellow; echo $argv; set_color normal; echo ']'
        functions -e wrap_git_time
    end

    if count $head >/dev/null
        set -l gtime (git log -1 --pretty=format:"%ar")
        wrap_time $gtime
    else
        wrap_time (date +%H:%M:%S)
    end
end
