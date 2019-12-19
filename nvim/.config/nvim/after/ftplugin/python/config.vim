noremap <buffer> <F5> :!python %<CR>
noremap <buffer> <F6> :silent !black %<CR>

let b:dispatch = 'python %'

fu! Noblack()
    let g:ale_fix_on_save=0
endfu!
