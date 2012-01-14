" Markdown to textile in clipboard
command! Markdown2Textile call <SID>Markdow2Textile2Clipboard()
function! <SID>Markdow2Textile2Clipboard()
    let @+=system("pandoc -f markdown -t textile", join(getline(1,line("$")), "\n"))
endfunction

" Prefix lines
command! -range=% -bar Prepend <line1>,<line2>call PrefixLines()
function! PrefixLines() range
    call inputsave()
    let t = input('Prefix: ')
    call inputrestore()
    exe a:firstline . ',' . a:lastline . 's/^/\=t'
endfunction

" Set working directory to the current file
command! CdToCurrentFile cd %:p:h

" Reload vimrc
command! ReloadVimrc source $MYVIMRC
