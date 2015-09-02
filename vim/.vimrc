set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

filetype plugin indent on

set laststatus=2

" plain-old configuration
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

set number
set showcmd
set cursorline

set complete+=kspell

set foldmethod=indent

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set ruler

:let mapleader=","

augroup configgroup
  autocmd BufEnter Makefile setlocal noexpandtab
  autocmd FileType java setlocal tabstop=4 shiftwidth=4
  autocmd FileType ruby source ~/.vim/ruby.vim
  autocmd FileType python source ~/.vim/python.vim
  autocmd FileType go source ~/.vim/go.vim
  autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal spell
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
augroup END
