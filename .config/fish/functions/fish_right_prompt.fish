function __fish_right_prompt_wrap_time
    echo '['; set_color yellow; echo $argv; set_color normal; echo ']'
end

function fish_right_prompt
    set -l head (git rev-parse --abbrev-ref HEAD ^/dev/null)
    set -l cur_time (date +%H:%M:%S)
    if test -n "$head"
        set -l gtime (git log -1 --pretty=format:"%ar" ^/dev/null)
        if test -n "$gtime"
            set cur_time $gtime
        end
    end
    __fish_right_prompt_wrap_time $cur_time
end
