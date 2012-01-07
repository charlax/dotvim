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

" No bell
set visualbell

" ============================================================
" Wrapping, textwidth, text formatting
" ============================================================

function s:setup_wrapping_for_code()
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
    set formatoptions=qrcn1
endfunction

function s:setup_wrapping_for_prose()
    set wrap linebreak nolist
endfunction

" Default
call s:setup_wrapping_for_code()


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
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" show list instead of just completing
set wildmenu
" command <Tab> completion, list matches, then longest common part, then all.
set wildmode=list:longest,full

" Status bar
set laststatus=2
set statusline=%t                     " filename
set statusline+=%h%m%r                " flags
set statusline+=\ %y                  " filetype
set statusline+=\ %P                  " %
set statusline+=%=                    " right-align
set statusline+=line:\ %l/%L\ col:\ %c\ \     " cursor column, line, total lines, %

" Provide some context when editing
set scrolloff=5

function s:setupMarkup()
    call s:setup_wrapping_for_prose()
    map <buffer> <Leader>p :Hammer<CR>
endfunction

if has("autocmd")
    " load file type plugins + indentation
    filetype plugin indent on

    " Custom filetypes
    au BufRead,BufNewFile *.json set filetype=json
    au BufRead,BufNewFile *.txt set filetype=markdown

    " Custom initialization
    au BufRead,BufNewFile *.applescript setf applescript
    au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
    au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

    " Prose
    au BufRead,BufNewFile *.{txt,csv} call s:setup_wrapping_for_prose()

    " Use hardwrapping for LaTeX files
    au FileType tex call s:setupMarkup()

    " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
    au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

    " In Makefiles, use real tabs, not tabs expanded to spaces
    au FileType make set noexpandtab

    " Use real tabs in Applescript
    au FileType applescript set noexpandtab

    " Yaml
    au FileType yaml set softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

    " Json
    au FileType json set softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

    " Remember last location in file
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal g'\"" | endif

    " Latex
    " Skim is the default viewer
    let g:LatexBox_viewer = 'skim'
    " Auto-update when file has changed
    let g:LatexBox_latexmk_options = '-pvc'

endif

" Prettify json
map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>

" Relative numbering of lines
set relativenumber

" Fixing Vim's regex handling
nnoremap / /\v
vnoremap / /\v

" Applies substitutions globally on lines,
" no need to type /g at the end of a substitutions
set gdefault


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

" Change tab label to just filename
set guitablabel=%f

" where to put backup files.
set backupdir=~/.vim/_backup
" where to put swap files.
set directory=~/.vim/_temp

" Command-T configuration
let g:CommandTMaxHeight=20

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" All folds open when open a file
set foldlevelstart=20


" ============================================================
" Most recently used (MRU)
" ============================================================

let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
let MRU_Window_Height = 15
let MRU_File = expand('~/.vim/.vim_mru_files')

" My other functions
source $HOME/.vim/my_functions.vim
