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

    " Custom initialization
    au BufRead,BufNewFile *.applescript setf applescript
    au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

    " Prose
    au FileType {md,markdown,tex,txt,rst} call s:setup_for_prose()

    " In Makefiles, use real tabs, not tabs expanded to spaces
    au FileType make set noexpandtab

    " Use tabs in Applescript
    au FileType applescript set noexpandtab smartindent

    " Yaml
    au FileType yaml set softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

    " Json
    au FileType json set softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

    " Remember last location in file, except in Git commit message
    au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
          \| exe "normal! g`\"" | endif

    autocmd FileType c,cpp,java,php,python,javascript,coffee,eco,html,css,mako,sql,json,rst,cucumber autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()
    autocmd FileType c,cpp,java,php,python,javascript,coffee,eco,html,css,mako,sql,json,rst,cucumber autocmd BufWritePre <buffer> :call TrimEndLines()

endif


" ============================================================
" Vim UI configuration
" ============================================================


if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized

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

" backspace through everything in insert mode
set backspace=indent,eol,start

" No bell
set visualbell

" Leaving buffer goes into normal mode
autocmd BufEnter * stopinsert

" Files to hide in netrw
let g:netrw_list_hide= '.*\.swp$,.*\.pyc$'

" All folds open when open a file
set foldlevelstart=20

" More natural split opening
set splitbelow
set splitright

" ============================================================
" Wrapping, textwidth, text formatting
" ============================================================

" Softwrapping
setlocal textwidth=0
setlocal wrap
set colorcolumn=79
highlight ColorColumn guibg=#eeeeee

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
    setlocal textwidth=79
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

" Clearing highlighted searches
nmap <silent> ,/ :nohlsearch<CR>

" Tab completion
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,*.pyc,.svn,vendor/gems/*,*/build/*

" show list instead of just completing
set wildmenu
" command <Tab> completion, list matches, then longest common part, then all.
set wildmode=list:longest,full

" Status bar
set laststatus=2
set statusline=%F                     " full path to file
set statusline+=%h%m%r                " flags
set statusline+=\ %y                  " filetype
set statusline+=\ %{fugitive#statusline()} " Current branch
set statusline+=%=                    " right-align
set statusline+=line:\ %l/%L\ %P\ col:\ %c\ \     " cursor column, line, total lines, %

" Provide some context when editing
set scrolloff=5

" Relative numbering of lines
set relativenumber

" Fixing Vim's regex handling
nnoremap / /\v
vnoremap / /\v

" ============================================================
" Paths
" ============================================================

" where to put backup files.
set backupdir=~/.vim/temp/backup
" where to put swap files.
set directory=~/.vim/temp/temp
" .netrwhist
let g:netrw_home = expand('~/.vim/temp/')

" My other functions

source $HOME/.vim/my_functions.vim
source $HOME/.vim/abbreviations.vim
" Plugin-specific configuration
source $HOME/.vim/pluginsrc.vim
" Keyboard shortcuts
source $HOME/.vim/keys.vim
