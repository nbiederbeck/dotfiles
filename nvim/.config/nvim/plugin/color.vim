syntax enable

set background=dark
colorscheme nord
let g:airline_theme='nord'
syntax on

let g:limelight_conceal_ctermfg = '8'

highlight Pmenu      cterm=none      ctermbg=none  ctermfg=none
set       nocursorline
highlight CursorLine cterm=none      ctermbg=0  ctermfg=none
highlight SpellBad   cterm=underline ctermbg=none  ctermfg=red
highlight SpellCap   cterm=underline ctermbg=none  ctermfg=yellow
highlight Conceal    cterm=none      ctermbg=none  ctermfg=none
highlight Visual     cterm=none      ctermbg=7 ctermfg=0

" python
highlight pythonSelf ctermfg=4
highlight Exception ctermfg=3

highlight todo ctermbg=none ctermfg=3
match todo /[Tt][Oo][Dd][Oo]/
