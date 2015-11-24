if ls /opt/local/bin >/dev/null ^/dev/null
    set -x PATH /opt/local/bin $PATH
end

# This doesn't actually have to be here, but since I'm sharing my config,
# I'll leave it here.
set -U EDITOR vim
