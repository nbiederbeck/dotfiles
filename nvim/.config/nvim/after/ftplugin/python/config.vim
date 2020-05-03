noremap <buffer> <F5> :!python %<CR>
noremap <buffer> <F6> :silent !black %<CR>

" let g:ale_fixers = {'python': ['black', 'isort']}
let g:ale_linters = {'python': ['flake8']}

" let g:ale_python_flake8_options = '--ignore E501'

let b:dispatch = 'python %'

fu! Noblack()
    let g:ale_fix_on_save=0
endfu!
