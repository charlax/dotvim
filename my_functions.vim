" Markdown to textile in clipboard
command Markdown2Textile call <SID>Markdow2Textile2Clipboard()
function! <SID>Markdow2Textile2Clipboard()
    let @+=system("pandoc -f markdown -t textile", join(getline(1,line("$")), "\n"))
endfunction

" Prefix lines
command PrefixLines call <SID>PrefixLines()

function! <SID>PrefixLines()
    substitute/^/input("Enter prefix text: ")/
endfunction

" Set working directory to the current file
command CdToCurrentFile exec 'lcd '.fnamemodify(resolve(expand('%')), ':p:h') 
