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
