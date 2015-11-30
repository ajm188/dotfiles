function __fish_pubkey_keylist
    set -l wd (pwd)
    cd $HOME/.ssh
    ls *.pub
    cd $wd
end

complete -f -c pubkey -a '(__fish_pubkey_keylist)'
