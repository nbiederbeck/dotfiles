" plugins
" -------
lua require('plugins')

call plug#begin(stdpath('data') . '/plugged')
Plug 'ziglang/zig.vim'
Plug 'dag/vim-fish'
" Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
    let g:fzf_layout = { 'down': '40%' }
    autocmd! FileType fzf
    autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
    function! s:find_git_root_or_else()
        return system('git rev-parse --show-toplevel 2>/dev/null')[:-2]
    endfunction
    command! ProjectFiles execute 'Files' s:find_git_root_or_else()
    let $BAT_THEME = 'Nord'
    let $FZF_DEFAULT_COMMAND = 'fd --type f'
    nmap <LEADER>/ :ProjectFiles <CR>
    nmap <LEADER><SPACE> :Rg<CR>
    nmap <LEADER>b :Buffers<CR>
Plug 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = 'context'
Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
    let g:UltiSnipsSnippetDirectories = ["mysnippets", "UltiSnips"]
    let g:UltiSnipsEditSplit = "vertical"
Plug 'honza/vim-snippets'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'vim-airline/vim-airline'
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#ale#enabled = 1
" Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
    let g:deoplete#enable_at_startup = 1
Plug 'arcticicestudio/nord-vim'
    let g:nord_uniform_status_lines = 1
    let g:nord_uniform_diff_background = 1
    let g:nord_cursor_line_number_background = 0
    let g:nord_bold_vertical_split_line = 0
    let g:nord_italic = 1
    let g:nord_bold = 1
    let g:nord_underline = 1
    let g:nord_italic_comments = 1
Plug 'davidhalter/jedi-vim', {'for': 'python', 'do': 'git submodule update --init --recursive'}
    let g:jedi#popup_on_dot = 1
    " let g:jedi#use_splits_not_buffers = 'right'
    " let g:jedi#completions_command = '<C-N>'
Plug 'junegunn/vim-easy-align'
    nmap ga <Plug>(EasyAlign)
    xmap ga <Plug>(EasyAlign)
" Plug 'deoplete-plugins/deoplete-jedi', {'for': 'python'}
let g:ale_completion_enabled = 0
let g:ale_completion_enabled = 1
Plug 'dense-analysis/ale'
    source $HOME/.config/nvim/ale.vim
Plug 'lervag/wiki.vim', {'for': 'wiki'}
Plug 'lervag/wiki-ft.vim', {'for': 'wiki'}
Plug 'lervag/vimtex', {'for': 'tex'}
    let g:vimtex_compiler_progname = 'nvr'
    let g:vimtex_view_mode='zathura'
    let g:vimtex_view_method='zathura'
    let g:vimtex_viewer_general='zathura'
    let g:vimtex_compiler_latexmk = {'build_dir': '/tmp/build', 'continuous': 1 }
    let g:vimtex_fold_enabled = 1
    let g:vimtex_view_automatic = 1
    let g:tex_flavor = 'lualatex'
    let g:vimtex_quickfix_mode = 2
    let g:vimtex_complete_close_braces = 0
    let g:vimtex_complete_recursive_bib = 1
    " autocmd BufReadPre *.tex let b:vimtex_main = 'main.tex'
    nnoremap <f8> :<c-u>call vimtex#delim#toggle_modifier_all()<cr>
Plug '907th/vim-auto-save'
    let g:auto_save_events = ['InsertLeave', 'TextChanged']
    let g:auto_save = 1
    let g:auto_save_silent = 1
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
    nmap <leader>gs :G<CR>
    nmap <leader>gl :diffget //3<CR>
    nmap <leader>gh :diffget //2<CR>
Plug 'tpope/vim-dispatch'
    autocmd FileType rust set makeprg=cargo\ build
    autocmd FileType python set makeprg=python\ %
Plug 'preservim/nerdtree'
    map <leader>t :NERDTreeToggle<CR>
Plug 'Raimondi/delimitMate'
Plug 'cespare/vim-toml'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

" general options
" ---------------
set lazyredraw
set notimeout
set ttimeout
set ttimeoutlen=10

set signcolumn=yes

set splitright
set splitbelow

set noshowmode

filetype plugin on
filetype plugin indent on
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
set magic
set hlsearch

set backspace=indent,eol,start
set list
set listchars=tab:\|\ ,trail:␣, "eol:\$, "space:␣,
set wrap
set linebreak
let &showbreak="→"
" hi NonText ctermfg=7 cterm=none
hi Whitespace ctermfg=8

set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set textwidth=79
set formatoptions=qrn1

set mouse=nvi  " no mouse use

set conceallevel=0
" set cursorline

set completeopt="menu,menuone,longest,preview"

" empty records
let @q=''

" undofiles
if empty(glob("~/.cache/vim/undo/"))
    silent execute '!mkdir -p ~/.cache/vim/undo/'
endif
" let &undodir = expand("~/.cache/vim/undo/")
set undofile

" global swap dir
if empty(glob("~/.cache/vim/swap/"))
    silent execute '!mkdir -p ~/.cache/vim/swap/'
endif
set directory^=~/.cache/vim/swap/
set swapfile

syntax enable
set background=light
colorscheme nord
let g:airline_theme='nord'
syntax on

let g:limelight_conceal_ctermfg = '8'

highlight todo ctermbg=none ctermfg=3
match todo /[Tt][Oo][Dd][Oo]/
highlight Debug ctermfg=3 cterm=bold
match Debug /breakpoint()/

" key remap
" ---------
map <SPACE> <Leader>
inoremap jk <ESC>
tnoremap <ESC> <C-\><C-N>
nnoremap <ESC> :nohl<CR>

map gf :vs <cfile><CR>
map gF :tabe <cfile><CR>

" navigate windows
nnoremap <C-J> <C-W>j
nnoremap <C-H> <C-W>h
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <TAB> gt
nnoremap <S-TAB> gT

" completions
inoremap <C-J> <C-N>
inoremap <C-K> <C-P>

autocmd BufReadPre *.uml set makeprg=plantuml\ %
nnoremap <Leader>m :Make<CR>
" nnoremap <Leader>m :split +resize\|startinsert term://make<CR>
" nnoremap <Leader>M :split +wincmd\ p term://make<CR>

lua <<EOF
-- require'lspconfig'.texlab.setup{}
EOF
lua <<EOF
require'nvim-treesitter.configs'.setup {
  indent = { enable = true },
  highlight = { enable = true },
}
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
