set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'thoughtbot/vim-rspec'
Plugin 'altercation/vim-colors-solarized'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/syntastic'

filetype plugin indent on

" configure lightline
let g:Powerline_symbols = 'fancy'
set laststatus=2
set noshowmode " don't have vim show things that lightline already shows

let g:lightline = {
      \ 'colorscheme' : 'wombat',
      \ 'active'      : {
      \   'left': [ [ 'mode', 'paste', 'filename', 'modified' ] ]
      \},
      \ 'separator'   : { 'left': "\u2b80", 'right': "\u2b82" },
      \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
      \}

" configure syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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

" clear the t_ut setting to disable Background Color Erase
" (only an issue in tmux)
:set t_ut=
