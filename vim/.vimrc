" load plugins from separate file
set runtimepath+=~/.config/nvim
source ~/.config/nvim/plugin/plugins.vim

set lazyredraw
set notimeout
set ttimeout
set ttimeoutlen=10

set splitright
set splitbelow

filetype plugin on
set modeline
set modelines=1

set encoding=utf-8
set fileencoding=utf-8

set number
set relativenumber
set scrolloff=2

set ignorecase
set smartcase
set gdefault
set incsearch

set backspace=indent,eol,start
set list
set listchars=tab:>-,trail:_, "eol:¬,space:.
set wrap
set linebreak
if has('nvim')
    set breakindent
endif
let &showbreak="→"

set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set textwidth=79
" set colorcolumn=+1
set formatoptions=qrn1

set mouse=  " no mouse use

set conceallevel=0
set cursorline

set completeopt="menu,menuone,longest,preview"

" empty records
let @q=''

" undofiles
let &undodir = expand("~/.cache/nvim/undo/")
if empty(glob("~/.cache/nvim/undo/"))
    silent execute '!mkdir -p ~/.cache/nvim/undo/'
endif
set undofile

set exrc
