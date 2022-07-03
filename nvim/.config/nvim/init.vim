lua require "plugins"
lua require "options"

colorscheme nord

set mouse=a

set number
set relativenumber

set splitbelow
set splitright

set expandtab
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4

set smartcase
set ignorecase

inoremap jk <ESC>
map <SPACE> <LEADER>

nnoremap <C-J> <C-W>j
nnoremap <C-H> <C-W>h
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

hi Search ctermbg=black ctermfg=none cterm=none

let g:did_load_filetypes = 0
let g:do_filetype_lua = 1
