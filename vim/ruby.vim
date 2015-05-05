function! EvalBuffer()
  call RunShellCommand("ruby %")
endfunction

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
map <leader>e :call EvalBuffer()<cr>
map <leader>f :call RunCurrentSpecFile()<cr>
map <leader>s :call RunNearestSpec()<cr>
map <leader>l :call RunLastSpec()<cr>
map <leader>a :call RunAllSpecs()<cr>
