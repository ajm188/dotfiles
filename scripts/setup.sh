#!/bin/bash
wd=$(pwd -P)

# https://stackoverflow.com/questions/226703/how-do-i-prompt-for-input-in-a-linux-shell-script
yesno () {
    while true; do
        read -p "$1 [y/n]" yn
        case $yn in
            [Yy]* ) return 0; break;;
            [Nn]* ) return 1;;
        esac
    done
}

# vim
if yesno "Do you want to install .vimrc + .vim?"; then
    ln -fs $wd/.vim/* $HOME/.vim/
    ln -fs $wd/.vimrc $HOME/.vimrc
fi

# bash
if yesno "Do you want to install .bashrc?"; then
    ln -fs $wd/.bashrc $HOME/.bashrc
    if [[ $(uname) = 'Darwin' ]]; then
        echo 'symlinked .bashrc to $HOME/.bashrc'
        echo 'you should probably have your .bash_profile source $HOME/.bashrc, or symlink .bash_profile yourself'
    fi
fi

if yesno "Do you want to install .config/fish?"; then
    mkdir -p $HOME/.config
    ln -fs $wd/.config/fish $HOME/.config/fish
fi

if yesno "Install .gitconfig ?"; then
    ln -fs $wd/.gitconfig $HOME/.gitconfig
fi

# tmux
if yesno "Do you want to setup .tmux.conf?"; then
    ln -fs $wd/.tmux.conf $HOME/.tmux.conf
    echo 'updated .tmux.conf. you should restart sessions to have the changes take affect'
fi

mkdir -p ~/bin && \
    ls $wd/scripts/bin | xargs -I{} ln -fs $wd/scripts/bin/{} ~/bin/{}
