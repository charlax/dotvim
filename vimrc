" Vi is useless
set nocompatible

syntax enable
set encoding=utf-8
let mapleader = ","

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" display incomplete commands
set showcmd
" load file type plugins + indentation
filetype plugin indent on

" change directory to current file directory
" :cd %:p:h
" Automatically change directory to current file (some plugin may not work)
" set autochdir

" Whitespace
set nowrap
set tabstop=4 shiftwidth=4
set softtabstop=4 " makes the spaces feel like real tabs
set expandtab
set backspace=indent,eol,start " backspace through everything in insert mode

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Custom filetypes
au BufRead,BufNewFile *.json set filetype=json
au BufRead,BufNewFile *.txt set filetype=md
au BufRead,BufNewFile *.applescript setf applescript

" Prettify json
map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>

" Fast saving
nmap <leader>w :w!<cr>

" Relative numbering of lines
set relativenumber

" Fixing Vim's regex handling
nnoremap / /\v
vnoremap / /\v

" Applies substitutions globally on lines,
" no need to type /g at the end of a substitutions
set gdefault

" Prevent hardwraping, use softwrap
set textwidth=0
set wrap
set formatoptions=qrn1
set colorcolumn=80

" Showing invisible characters with the same characters that TextMate uses
set list
set listchars=tab:▸\ ,eol:¬

" To do things right
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Movement by screen line instead of file line
nnoremap j gj
nnoremap k gk

" Strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Re-hardwrap paragraphs of text
nnoremap <leader>q gqip

" Reselect the text that was just pasted
nnoremap <leader>v V`]

" Exit back to normal mode
inoremap jj <ESC>

" Open a new vertical split and switch over to it
" nnoremap <leader>w <C-w>v<C-w>l

" <leader>P is for vim-preview (markdown)
" https://github.com/greyblake/vim-preview

" Markdown to textile in clipboard
command Markdown2Textile call <SID>Markdow2Textile2Clipboard()
function! <SID>Markdow2Textile2Clipboard()
  let @+=system("pandoc -f markdown -t textile", join(getline(1,line("$")), "\n"))
endfunction

" Change tab label to just filename
set guitablabel=%f

" show list instead of just completing
set wildmenu
" command <Tab> completion, list matches, then longest common part, then all.
set wildmode=list:longest,full

" Cmd Shift T opens new tab
nmap <D-T> :tabnew<CR>:CommandT<CR>
imap <D-T> <Esc>:tabnew<CR>:CommantT<CR>

" Cmd Shit T in CommandT plugin opens a new tab
let g:CommandTAcceptSelectionTabMap = '<D-T>'

" where to put backup files.
set backupdir=~/.vim/_backup
" where to put swap files.
set directory=~/.vim/_temp
