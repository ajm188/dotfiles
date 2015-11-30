function hide
    for f in $argv
        mv "$f" ".$f"
    end
end
