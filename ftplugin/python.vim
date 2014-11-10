" make Python follow PEP8
setl softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" Wrap at 72 chars for comments.
setl formatoptions=cq textwidth=72 foldignore= wildignore+=*.py[co]

" Remove extra space before and after = in selection
command! -range RemoveExtraEqualSpace <line1>,<line2>s/ \+= \+/=/g

map <Leader>d :call InsertPDBLine()<CR>

function! InsertPDBLine()
    let trace = expand("import ipdb; ipdb.set_trace()  # FIXME REMOVE")
    execute "normal o".trace
endfunction

" autocmd BufWritePost *.py call Flake8()
" Show errors in gutter
let g:flake8_show_in_gutter=1
