" Must be first.
set nocompatible

syntax enable
set encoding=utf-8

" Mapping leader to comma
let mapleader = ","
let maplocalleader = ","

" Using tpope's Pathogen to load all the plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" ============================================================
" Filetype detection
" ============================================================

if has("autocmd")
    " load file type plugins + indentation
    filetype plugin indent on

    " Custom filetypes
    au BufRead,BufNewFile *.json set filetype=json
    au BufRead,BufNewFile *.txt set filetype=markdown

    " Custom initialization
    au BufRead,BufNewFile *.applescript setf applescript
    au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

    " Prose
    au FileType {md,markdown,tex,txt} call s:setup_for_prose()

    " In Makefiles, use real tabs, not tabs expanded to spaces
    au FileType make set noexpandtab

    " Use tabs in Applescript
    au FileType applescript set noexpandtab smartindent

    " Yaml
    au FileType yaml set softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

    " Json
    au FileType json set softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

    " Remember last location in file
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal g'\"" | endif

    autocmd FileType c,cpp,java,php,python,javascript autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()
    autocmd FileType c,cpp,java,php,python,javascript autocmd BufWritePre <buffer> :call TrimEndLines()

    " Latex
    " Skim is the default viewer
    let g:LatexBox_viewer = 'skim'
    " Auto-update when file has changed
    let g:LatexBox_latexmk_options = '-pvc'

endif


" ============================================================
" Vim UI configuration
" ============================================================

" display incomplete commands
set showcmd

" Store lots of :cmdline history
set history=1000

" Reload files changed outside vim
set autoread

" Sets the terminal title to Vim title
set title

" Whitespace
set tabstop=4 shiftwidth=4
set softtabstop=4 " makes the spaces feel like real tabs
set expandtab
set backspace=indent,eol,start " backspace through everything in insert mode

" Highlights trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" No bell
set visualbell

" Leaving buffer goes into normal mode
autocmd BufEnter * stopinsert

" Files to hide in netrw
let g:netrw_list_hide= '.*\.swp$,.*\.pyc$'

" ============================================================
" Wrapping, textwidth, text formatting
" ============================================================

" Softwrapping
set textwidth=0
set wrap
set colorcolumn=79

" Showing invisible characters with the same characters that TextMate uses
set list
set listchars=tab:▸\ ,eol:¬

" q: Allow formatting of comments with "gq".
" r: Automatically insert the current comment leader after hitting <Enter>
" c: Auto-wrap comments using textwidth
" n: When formatting text, recognize numbered lists.
" 1: Don't break a line after a one-letter word.
setlocal formatoptions=qrcn1

function! s:setup_for_prose()
    set textwidth=79
    setlocal nolist linebreak
    setlocal spell
    " For bulleted list to get correct indentation
    setlocal autoindent
endfunction


" ============================================================
" Searching
" ============================================================

" Highlight searches by default
set hlsearch

" Find the next match as we type the search
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,*.pyc,.svn,vendor/gems/*

" show list instead of just completing
set wildmenu
" command <Tab> completion, list matches, then longest common part, then all.
set wildmode=list:longest,full

" Status bar
set laststatus=2
set statusline=%F                     " full path to file
set statusline+=%h%m%r                " flags
set statusline+=\ %y                  " filetype
set statusline+=%=                    " right-align
set statusline+=line:\ %l/%L\ %P\ col:\ %c\ \     " cursor column, line, total lines, %

" Provide some context when editing
set scrolloff=5

" Prettify json
map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>

" Relative numbering of lines
set relativenumber

" Fixing Vim's regex handling
nnoremap / /\v
vnoremap / /\v

" ============================================================
" Keyboard shortcuts
" ============================================================

" Fast saving
nmap <leader>w :w!<cr>

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

" Easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Shows 20 lines of ctrlp
let g:ctrlp_max_height = 20

" CtrlPMixed (files + MRU + Buffers) is the default
let g:ctrlp_cmd = 'CtrlPMixed'

" CtrlPTags
nnoremap <leader>t :CtrlPTag<CR>

" C-\ - Open the definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" A-] - Open the definition in a vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" To prefix lines
noremap <leader>i :s/^/\V

" All folds open when open a file
set foldlevelstart=20

" Re-indent file, keeping cursor position
map <leader>i mzgg=G`z<CR>

" Will toggle the Tagbar window
nmap <F8> :TagbarToggle<CR>

" ============================================================
" Paths
" ============================================================

" where to put backup files.
set backupdir=~/.vim/temp/backup
" where to put swap files.
set directory=~/.vim/temp/temp
" .netrwhist
let g:netrw_home = expand('~/.vim/temp/')

" ============================================================
" Plugin-specific configuration
" ============================================================

" Disable automatic highlighting
let b:easytags_auto_highlight = 0

" My other functions
source $HOME/.vim/my_functions.vim
source $HOME/.vim/abbreviations.vim
