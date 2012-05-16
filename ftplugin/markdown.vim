" See gvimrc for keyboard shortcuts, cf. http://superuser.com/questions/319591/how-can-i-prevent-macvim-from-showing-os-x-find-replace-dialog-when-pressing-co

vmap <C-b> c**<C-R>"**<ESC>

" Better linebreaks for markdown. Does not work with 'list' option
setl nolist linebreak

" Markdown to textile in clipboard
command! Markdown2Textile2Clipboard call <SID>Markdow2Textile2Clipboard()
function! <SID>Markdow2Textile2Clipboard()
    let @+=system("pandoc -f markdown -t textile", join(getline(1,line("$")), "\n"))
endfunction

" Markdown to html in clipboard
command! Markdown2HTML2Clipboard call <SID>Markdown2Textile2Clipboard()
function! <SID>Markdown2Textile2Clipboard()
    let @+=system("pandoc -f markdown -t html", join(getline(1, line("$")), "\n"))
endfunction
