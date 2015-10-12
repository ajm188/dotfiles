set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'fatih/vim-go'
Plugin 'kien/ctrlp.vim'

call vundle#end()

filetype plugin indent on

set laststatus=2

:let mapleader=","

let g:ctrlp_map = '<c-f>'
cnoremap <expr> %% expand('%:h').'/'
nnoremap <c-d> :CtrlP %%<cr>
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<c-e>'],
  \ 'AcceptSelection("t")': ['<cr>', '<c-t>'],
  \}

nnoremap <leader><leader> <c-^>

function! TabWrap()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <expr> <tab> TabWrap()
inoremap <s-tab> <c-n>

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
set foldlevel=3

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set ruler
set autoread

augroup configgroup
  autocmd BufEnter Makefile setlocal noexpandtab
  autocmd FileType java setlocal tabstop=4 shiftwidth=4
  autocmd FileType ruby source ~/.vim/ruby.vim
  autocmd FileType python source ~/.vim/python.vim
  autocmd FileType go source ~/.vim/go.vim
  autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal spell
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
augroup END
