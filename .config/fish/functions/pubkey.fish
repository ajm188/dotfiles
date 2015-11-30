function pubkey
    set -l ssh_dir $HOME/.ssh
    set -l pub_key $ssh_dir/id_rsa.pub
    switch (count $argv)
    case '0'
    case '*'
        set pub_key $ssh_dir/$argv[1]
    end
    cat $pub_key
end
