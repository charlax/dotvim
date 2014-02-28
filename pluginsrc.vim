" Latex
" Skim is the default viewer
let g:LatexBox_viewer = 'skim'
" Auto-update when file has changed
let g:LatexBox_latexmk_options = '-pvc'

" Shows 20 lines of ctrlp
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = '([^\/]+\/)*_build\|node_modules\|DS_Store\|git\|htmlcov'

" Filter out .pyc files in NERDTree
let NERDTreeIgnore = ['\.pyc$']

" Only the test file is prefixed with 'test_'
let PyUnitTestsStructure = "disabled"

" Do not conceal quotes in JSON
let g:vim_json_syntax_conceal = 0
