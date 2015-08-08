# vim
wd=$(pwd -P)
ln -Fs $wd/vim $HOME/.vim
ln -fhs $wd/vim/vimrc $HOME/.vimrc
vim +PluginInstall +qall

# bash
ln -fhs $wd/bash/.bashrc $HOME/.bashrc
if [[ $(uname) = 'Darwin' ]]; then
  echo 'symlinked bash/.bashrc to $HOME/.bashrc'
  echo 'you should probably have your .bash_profile source $HOME/.bashrc, or symlink .bash_profile yourself'
fi
