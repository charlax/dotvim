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

" Easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

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

" Re-indent file, keeping cursor position
map <leader>i mzgg=G`z<CR>

" Prettify json
map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>

" Use :W! to write to a file using sudo if you forgot to 'sudo vim file'
cmap W! %!sudo tee > /dev/null %
