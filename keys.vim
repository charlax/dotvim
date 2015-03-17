" To check if a key is used:
" :verbose map <key>

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>. :w<cr>
imap <leader>. <ESC>:w<cr>
nmap <leader>m :wq<cr>

" To do things right
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Map space to move by one screen
nnoremap <space> <C-f>
" Should only work in GVim
nnoremap <S-space> <C-b>

" Movement by screen line instead of file line
nnoremap j gj
nnoremap k gk

" Strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Re-hardwrap paragraphs of text
nnoremap <leader>q gqip

" Re-hardwrap but first separate from next line
nnoremap <leader>Q o<esc>kgqip

" Re-indent file, keeping cursor position
map <leader>= mzgg=G`z<CR>

" Reselect the text that was just pasted
nnoremap <leader>v V`]

" Easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" CtrlPTags
nnoremap <leader>t :CtrlPTag<CR>

" Open the tag definition in a new tab
nnoremap <leader>] :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Open the tag definition in a vertical split (this is <A-]>).
nnoremap ‘ :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" To prefix lines
noremap <leader>i :s/^/\V

" Prettify json
map <leader>js <Esc>:%!python -mjson.tool<CR>
" Prettify Python
vnoremap <leader>pp <Esc>:'<,'>!pypprint<CR>

" Use :W! to write to a file using sudo if you forgot to 'sudo vim file'
cmap W! %!sudo tee > /dev/null %

" Preview file
nmap <Leader>P :Preview<CR>

" Open NERDTree
map <Leader>p :NERDTreeToggle<CR>

" Underline the current line with '='
nmap <silent> <leader>ul :t.<CR>Vr=

" Underline the current line with '-'
nmap <silent> <leader>uL :t.<CR>Vr-

" Underline the current line with '^'
nmap <silent> <leader>Ul :t.<CR>Vr^

" Underline the current line with '^'
nmap <silent> <leader>UL :t.<CR>Vr"

" Reselect visual block after indent change
vnoremap < <gv
vnoremap > >gv

" Move lines up and down
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
inoremap <leader>j <Esc>:m .+1<CR>==gi
inoremap <leader>k <Esc>:m .-2<CR>==gi
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv

" Highlight and copy as RTF
vnoremap <leader>h :RTFHighlight python<CR>
