if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

let g:ale_linters = {'tex': ['chktex', 'vale', 'write-good']}
" let g:ale_tex_chktex_options = '-eall -n22 -n30 -n46'
let b:indentLine_enabled = 0

let g:vimtex_complete_bib = {'simple': 1}
let g:vimtex_quickfix_blgparser = {'disable': 1}
let g:vimtex_parser_bib_backend = 'vim'
