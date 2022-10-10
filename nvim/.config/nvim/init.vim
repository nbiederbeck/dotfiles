filetype plugin indent on

lua require("bootstrap")
lua require("plugins")
lua require("options")

let g:airline#extensions#tabline#enabled = 1

colorscheme nord

set mouse=a

set number
set relativenumber
set cursorline
set scrolloff=2
set signcolumn=yes

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
let mapleader=' '

nnoremap <C-J> <C-W>j
nnoremap <C-H> <C-W>h
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

nmap <LEADER>m :Make<CR>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
