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
ln -fs $wd/vim/.vim $HOME/.vim
if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
  # give the people vundle if they don't have it
  git clone git@github.com:gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi
ln -fs $wd/vim/.vimrc $HOME/.vimrc
vim +PluginInstall +qall

# bash
if yesno "Do you want to install .bashrc?"; then
    ln -fs $wd/bash/.bashrc $HOME/.bashrc
    if [[ $(uname) = 'Darwin' ]]; then
        echo 'symlinked bash/.bashrc to $HOME/.bashrc'
        echo 'you should probably have your .bash_profile source $HOME/.bashrc, or symlink .bash_profile yourself'
    fi
fi
