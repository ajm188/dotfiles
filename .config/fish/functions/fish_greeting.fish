function fish_greeting
    if which fortune >/dev/null
        if which cowsay >/dev/null
            fortune | cowsay
        else
            fortune
        end
    else
        echo Welcome to fish, the friendly interactive shell
        echo -n 'Type '; set_color green; echo -n 'help '; set_color normal
        echo for instructions on how to use fish
    end
end
