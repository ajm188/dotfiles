setlocal shiftwidth=4
setlocal tabstop=4
setlocal noexpandtab

nmap <leader>b :w\|:!go build .<cr>
nmap <leader>t :w\|:!go test .<cr>
nmap <leader>g :w\|:!go fmt %<cr>
