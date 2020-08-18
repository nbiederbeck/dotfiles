noremap <buffer> <F5> :!python %<CR>
noremap <buffer> <F6> :silent !black %<CR>

let g:ale_fixers = {'python': ['black']}
let g:ale_linters = {'python': ['flake8', 'pylint']}

let g:ale_python_pylint_options = '--disable=C0103 --jobs=0'
let g:ale_python_flake8_options = '--ignore=E501'
let g:ale_python_black_options = '--skip-string-normalization --line-length=79'

let b:dispatch = 'python %'

fu! Noblack()
    let g:ale_fix_on_save=0
endfu!
