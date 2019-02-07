noremap <buffer> <F5> :!python %<CR>
noremap <buffer> <F6> :silent !black %<CR>

let b:dispatch = 'python %'

let g:ale_linters = {'python': ['flake8']}
let g:ale_python_flake8_options = '--select=N,F,H,D,R, --ignore=D100'
let g:ale_fixers = {'python': ['yapf']}
