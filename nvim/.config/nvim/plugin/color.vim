syntax enable

set background=light
colorscheme one
let g:airline_theme='one'
set termguicolors

" set termguicolors
syntax on

let g:limelight_conceal_ctermfg = '8'

highlight Pmenu      cterm=none      ctermbg=none  ctermfg=none
set       nocursorline
highlight CursorLine cterm=none      ctermbg=none  ctermfg=none
highlight SpellBad   cterm=underline ctermbg=none  ctermfg=red
highlight SpellCap   cterm=underline ctermbg=none  ctermfg=yellow
highlight Conceal    cterm=none      ctermbg=none  ctermfg=none
highlight Visual     cterm=none      ctermbg=7 ctermfg=0

" python
highlight pythonSelf ctermfg=4
highlight Exception ctermfg=3

let g:lengthmatters_highlight_one_column = 1
call lengthmatters#highlight('ctermfg=1')

highlight todo ctermbg=none ctermfg=3
match todo /[Tt][Oo][Dd][Oo]/
