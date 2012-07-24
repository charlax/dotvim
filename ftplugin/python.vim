" Wrap at 72 chars for comments.
setl formatoptions=cq textwidth=72 foldignore= wildignore+=*.py[co]

" make Python follow PEP8
setl softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" Loads ropevim
source /Library/Python/2.7/site-packages/ropevim-0.4-py2.7.egg/share/vim/plugin/ropevim.vim

" Automatically strip trailing whitespace
autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()
