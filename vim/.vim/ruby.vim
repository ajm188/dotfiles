function! ToggleComment(toggle_on)
  if a:toggle_on
    normal ^i# 
  else
    normal ^
    normal dw
  endif
endfunction

map <leader>lc :call ToggleComment(1)<cr>
map <leader>uc :call ToggleComment(0)<cr>

if !exists('g:current_spec_file')
  let g:current_spec_file=''
endif

function! RunSpecFile()
  let current_file = expand('%:t')
  if split(substitute(current_file, '\.rb', '', ''), '_')[-1] == 'spec'
    let g:current_spec_file=expand('%')
  endif
  :w
  :execute "!rspec " . g:current_spec_file
endfunction

nnoremap <leader>t :call RunSpecFile()<cr>
