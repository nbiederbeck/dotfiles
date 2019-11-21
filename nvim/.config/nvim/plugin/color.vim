syntax enable

set background=light
colorscheme nord

" set termguicolors
syntax on

let g:limelight_conceal_ctermfg = '8'

highlight Pmenu      guibg=#FFFFFF   ctermbg=7    guifg=#000000 ctermfg=0
highlight CursorLine cterm=underline ctermbg=none ctermfg=none
highlight SpellBad   cterm=bold      ctermbg=none ctermfg=red
highlight SpellCap   cterm=bold      ctermbg=yellow ctermfg=none
highlight Visual     cterm=bold
highlight Conceal    cterm=NONE      ctermbg=NONE ctermfg=NONE guifg=NONE guibg=NONE gui=NONE

" python
highlight pythonSelf ctermfg=4
highlight Exception ctermfg=3
