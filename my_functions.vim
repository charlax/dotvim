
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

""" FocusMode
function! ToggleFocusMode()
    if (&foldcolumn != 12)
        set laststatus=0
        set numberwidth=10
        set foldcolumn=12
        set noruler
        hi FoldColumn ctermbg=none
        hi LineNr ctermfg=0 ctermbg=none
        hi NonText ctermfg=0
    else
        set laststatus=2
        set numberwidth=4
        set foldcolumn=0
        set ruler
        execute 'colorscheme ' . g:colors_name
    endif
endfunc
nnoremap <leader>V  :call ToggleFocusMode()<cr>
