set sw=2 ts=2 sts=2
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

function! IsSpecFile(file)
  return split(substitute(a:file, '\.rb', '', ''), '_')[-1] == 'spec'
endfunction

if !exists('g:current_spec_file')
  let g:current_spec_file=''
endif

function! RunSpecFile()
  if IsSpecFile(expand('%:t'))
    let g:current_spec_file=expand('%')
  endif
  :w
  :execute "!rspec " . g:current_spec_file
endfunction

nnoremap <leader>t :call RunSpecFile()<cr>

if !exists('*OpenSpec')
  function! OpenSpec()
    let l:filename=expand('%:t')
    if IsSpecFile(l:filename)
      echo 'Already in spec file'
      return
    endif
    let l:path=['spec'] + split(expand('%'), '/')[1:-2]
    let l:spec_to_open=join(path, '/') . '/' . substitute(filename, '\.rb', '_spec.rb', '')
    exe "e " . l:spec_to_open
  endfunction

  nnoremap <leader>s :call OpenSpec()<cr>
endif
