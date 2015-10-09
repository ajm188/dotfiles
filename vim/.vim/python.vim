setlocal tabstop=4
setlocal shiftwidth=4
map <leader>p :w\|:!pep8 %
map <leader>a :w\|:!autopep8 % -i
