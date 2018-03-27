function! PrettyHTML()
    set sw=2
    %s/>/>\r/g
    execute 'normal gg=G'
endfunction
command! PrettyHTML call PrettyHTML()
