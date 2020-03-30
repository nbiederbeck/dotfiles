syntax enable

set background=light
colorscheme nord

" set termguicolors
syntax on

let g:limelight_conceal_ctermfg = '8'

highlight Pmenu      cterm=none      ctermbg=none ctermfg=none
set       nocursorline
highlight CursorLine cterm=none      ctermbg=none ctermfg=none
highlight SpellBad   cterm=none      ctermbg=none ctermfg=red
highlight SpellCap   cterm=underline ctermbg=none ctermfg=yellow
highlight Conceal    cterm=bold      ctermbg=none ctermfg=green
highlight Visual     cterm=bold

" python
highlight pythonSelf ctermfg=4
highlight Exception ctermfg=3

let g:lengthmatters_highlight_one_column = 0
call lengthmatters#highlight('ctermfg=yellow cterm=underline')
