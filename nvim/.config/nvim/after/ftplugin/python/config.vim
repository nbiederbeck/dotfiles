noremap <buffer> <F5> :!python %<CR>
noremap <buffer> <F6> :silent !black %<CR>

let g:ale_fixers = {'python': ['black']}
let g:ale_linters = {'python': ['pyflakes']}

let b:dispatch = 'python %'

fu! Noblack()
    let g:ale_fix_on_save=0
endfu!
