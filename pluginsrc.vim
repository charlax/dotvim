" Disable automatic highlighting
let b:easytags_auto_highlight = 0

" Will toggle the Tagbar window
nmap <F8> :TagbarToggle<CR>

" Latex
" Skim is the default viewer
let g:LatexBox_viewer = 'skim'
" Auto-update when file has changed
let g:LatexBox_latexmk_options = '-pvc'

" Shows 20 lines of ctrlp
let g:ctrlp_max_height = 20

" CtrlPMixed (files + MRU + Buffers) is the default
let g:ctrlp_cmd = 'CtrlPMixed'
