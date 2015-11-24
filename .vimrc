" VUNDLE SETUP "
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'fatih/vim-go'
Plugin 'kien/ctrlp.vim'
Plugin 'Yggdroot/indentLine'

call vundle#end()

filetype plugin indent on

" PLUGIN CONFIGURATIONS "
let g:ctrlp_map = '<c-f>' " start Ctrl-P with <c-f>
cnoremap <expr> %% expand('%:h').'/'
" Ctrl-P, scoped to the current directory
nnoremap <c-d> :CtrlP %%<cr>
" Remap <cr> in Ctrl-P from :e to :tabn
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<c-e>'],
  \ 'AcceptSelection("t")': ['<cr>', '<c-t>'], 
  \}

" LEADER KEY "
:let mapleader=","

" MULTI-PURPOSE TAB KEY from garybernhardt/dotfiles "
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

" HIGHLIGHT SEARCHES "
function! HighlightSearch()
  :set hlsearch
  return "\/"
endfunction
nmap <expr> / HighlightSearch()
nmap <leader>hl :set nohlsearch<cr>

" STATUSLINE "
" Left column: filename, plus file type, format, encoding and mod status
" Right column: line and column number, shifted left a bit
set statusline=%<%f\ (%{&ft})\ [%{&ff}][%{&fenc}]%(%m%)%=%-10(%3l,%02c%03V%)

" SYNTAX HL AND COLOR "
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" GENERAL CONFIG "
set number
set showcmd
set cursorline
set autoread

set laststatus=2
set showtabline=2

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

set foldmethod=indent
set foldlevel=2

set ignorecase
set smartcase

" backspace stopped working when I upgraded to vim 7.4. I have no idea why.
" http://vim.wikia.com/wiki/Backspace_and_delete_problems
" #Backspace_key_won.27t_move_from_current_line fixes it
set backspace=2

" MISC KEYMAPPINGS "
" More keymappings in language-specific files
nnoremap <leader><leader> <c-^> " Quickly switch between current/prev buffers

" AUTOCMDS "
augroup configgroup
  autocmd BufEnter Makefile set noexpandtab
  autocmd FileType ruby source ~/.vim/ruby.vim
  autocmd FileType python source ~/.vim/python.vim
  autocmd FileType go source ~/.vim/go.vim
  autocmd BufNewFile,BufRead COMMIT_EDITMSG set spell
  autocmd BufNewFile,BufRead *.md set filetype=markdown
augroup END