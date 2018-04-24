function! PrettyHTML()
    set sw=2
    %s/>/>\r/g
    execute 'normal gg=G'
endfunction
command! PrettyHTML call PrettyHTML()

set softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent
