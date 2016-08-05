setlocal shiftwidth=8
setlocal tabstop=8
setlocal noexpandtab

nmap <leader>b :w\|:!go build .<cr>
nmap <leader>t :w\|:!go test .<cr>
nmap <leader>g :w\|:!go fmt %<cr>
