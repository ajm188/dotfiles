function! Def()
  :call s:body("def " . input("Method name: "))
endfunction

function! Class()
  :call s:body("class " . input("Class name: "))
endfunction

function! Module()
  :call s:body("module " . input("Module name: "))
endfunction

function! ToggleComment(toggle_on)
  if a:toggle_on
    normal ^i# 
  else
    normal 0
    normal /#<cr>
    normal dw
  endif
endfunction

function! InlineRefactor()
  normal ^*dw
  normal ``d2w
  normal "ad$
  normal dd
  normal ``h"ap
endfunction

function! s:body(name)
  let @x = a:name
  normal "xp
  normal oend
  normal ko  
endfunction

map <leader>c :call Class()<cr>
map <leader>d :call Def()<cr>
map <leader>m :call Module()<cr>
map <leader>lc :call ToggleComment(1)<cr>
map <leader>uc :call ToggleComment(0)<cr>
map <leader>ir :call InlineRefactor()<cr>
