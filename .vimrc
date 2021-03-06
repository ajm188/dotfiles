set nocompatible
filetype off
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
filetype plugin indent on

" PLUGIN CONFIGURATIONS "
let g:go_fmt_autosave=0

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
set incsearch

" STATUSLINE "
" Left column: filename, plus file type, format, encoding and mod status
" Right column: line and column number, shifted left a bit
set statusline=%<%f\ (%{&ft})\ %{fugitive#statusline()}%(%m%)%=%-10(%3l,%02c%03V%)

" SYNTAX HL AND COLOR "
" colorschemes that don't muck with my transparent term:
"   default
"   deep-space
"   angr
set t_Co=256
syntax enable
set background=dark
colorscheme falcon

" GENERAL CONFIG "
set number
set showcmd
set autoread
set cursorline

set laststatus=2
set showtabline=1

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

set foldmethod=indent
set foldlevel=2

set ignorecase
set smartcase

set noswapfile
set nobackup
set nowritebackup
set backupdir=~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.tmp,~/tmp,/var/tmp,/tmp

set textwidth=79

set formatoptions+=j

" backspace stopped working when I upgraded to vim 7.4. I have no idea why.
" http://vim.wikia.com/wiki/Backspace_and_delete_problems
" #Backspace_key_won.27t_move_from_current_line fixes it
set backspace=indent,eol,start

" MISC KEYMAPPINGS "
" More keymappings in language-specific files
nnoremap <leader><leader> <c-^> " Quickly switch between current/prev buffers

nnoremap <leader>ff :Files<cr>
nnoremap <leader>fgs :GFiles?<cr>
nnoremap <leader>fbu :Buffers<cr>
nnoremap <leader>fgc :Commits<cr>
nnoremap <leader>fgb :BCommits<cr>
nnoremap <leader>fm :Maps<cr>

nnoremap <leader>g :Goyo<cr>
nnoremap <leader>l :Limelight!!<cr>

" vim-terraform
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1

" AUTOCMDS "
augroup configgroup
  au!
  autocmd FileType python source ~/.vim/python.vim
  autocmd FileType go source ~/.vim/go.vim
  autocmd BufNewFile,BufRead COMMIT_EDITMSG set spell
  autocmd BufNewFile,BufRead *.md set filetype=markdown spell textwidth=0
  autocmd BufEnter Makefile set noexpandtab
  autocmd FileType ruby set ts=2 sw=2 sts=2
  autocmd FileType cucumber set ts=2 sw=2 sts=2
  autocmd FileType html set spell
  autocmd FileType tf set ts=2 sw=2 sts=2 smartindent
  autocmd BufNewFile,BufRead *.tex set ft=tex
  autocmd BufNewFile,BufRead *.tex map ,b :w\|:!pdflatex %<cr>
augroup END
