wd=$(pwd -P)

# vim
ln -fs $wd/vim/.vim $HOME/.vim
if [ !-d $HOME/.vim/bundle/Vundle.vim ]
  # give the people vundle if they don't have it
  git clone git@github.com:gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi
ln -fs $wd/vim/.vimrc $HOME/.vimrc
vim +PluginInstall +qall

# bash
ln -fs $wd/bash/.bashrc $HOME/.bashrc
if [[ $(uname) = 'Darwin' ]]; then
  echo 'symlinked bash/.bashrc to $HOME/.bashrc'
  echo 'you should probably have your .bash_profile source $HOME/.bashrc, or symlink .bash_profile yourself'
fi
