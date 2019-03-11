noremap <buffer> <F5> :!python %<CR>
noremap <buffer> <F6> :silent !black %<CR>

let b:dispatch = 'python %'

let g:ale_linters = {'python': ['flake8']}
let g:ale_python_flake8_options = '--select=N,F,H,D,R, --ignore=D100'
let g:ale_python_flake8_executable = '/home/nbiederbeck/anaconda3/bin/flake8'
let g:ale_fixers = {'python': ['black']}
let g:ale_python_black_options = '--skip-string-normalization --line-length=79'
let g:ale_python_black_options = '--line-length=79'
let g:ale_python_black_executable = '/home/nbiederbeck/anaconda3/bin/black'
