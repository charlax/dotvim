nmap <leader>b <Plug>(go-build)

if has("gui_vimr")
    nmap <D-r> :w<CR>:GoBuild<CR>
    vmap <D-r> :w<CR>:GoBuild<CR>
    imap <D-r> <ESC>:w<CR>:GoBuild<CR>
endif

nmap <F7> <Plug>(go-build)

nmap <leader>c <Plug>(go-coverage)

let g:go_fmt_command = "goimports"
call deoplete#enable()
