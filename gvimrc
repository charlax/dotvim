color pyte

set guifont=Menlo:h14
set antialias
set linespace=2

" Show cursor line
set cursorline

" Changing the color for invisible characters
hi NonText guifg=#c0c0c0 guibg=NONE
hi SpecialKey guifg=#c0c0c0 guibg=NONE

macm Window.Select\ Previous\ Tab  key=<D-A-Left>
macm Window.Select\ Next\ Tab    key=<D-A-Right>

" Don't beep
set visualbell

" Start without the toolbar
set guioptions-=T

if has("gui_macvim")
    " Fullscreen takes up entire screen
    set fuoptions=maxhorz,maxvert
    macmenu &Tools.Make key=<nop>
end

" Remove toolbar
set guioptions=egmrt

" Keep undo history across sessions, by storing in file.
" Only works in MacVim (gui) mode.
set undodir=~/.vim/backups
set undofile
