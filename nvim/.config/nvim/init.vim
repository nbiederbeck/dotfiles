lua require "plugins"
lua require "options"

colorscheme gruvbox

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

inoremap jk <ESC>
map <SPACE> <LEADER>

nnoremap <C-J> <C-W>j
nnoremap <C-H> <C-W>h
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
