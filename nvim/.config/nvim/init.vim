" plugins
" -------
call plug#begin(stdpath('data') . '/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = '<C-n>'
Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
    let g:UltiSnipsSnippetDirectories = ["mysnippets", "UltiSnips"]
    let g:UltiSnipsEditSplit = "vertical"
Plug 'honza/vim-snippets'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#ale#enabled = 1
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
    let g:deoplete#enable_at_startup = 1
Plug 'arcticicestudio/nord-vim'
    let g:nord_uniform_diff_background = 1
    let g:nord_cursor_line_number_background = 0
    let g:nord_bold_vertical_split_line = 0
    let g:nord_italic = 1
    let g:nord_bold = 1
    let g:nord_underline = 1
    let g:nord_italic_comments = 1
Plug 'davidhalter/jedi-vim', {'for': 'python'}
    let g:jedi#popup_on_dot = 1
    let g:jedi#use_splits_not_buffers = "right"
Plug 'junegunn/vim-easy-align'
    nmap ga <Plug>(EasyAlign)
    xmap ga <Plug>(EasyAlign)
Plug 'deoplete-plugins/deoplete-jedi', {'for': 'python'}
Plug 'dense-analysis/ale'
    nmap <F8> <Plug>(ale_fix)
    let g:ale_sign_error = '??'
    let g:ale_sign_warning = '!?'
    let g:ale_sign_info = '--'
    let g:ale_sign_column_always = 1
    let g:ale_lint_on_text_changed = 'normal' " 'normal'/'never'
    let g:ale_lint_on_enter = 1
    let g:ale_lint_on_save = 1
    let g:ale_fix_on_save = 0
    let g:ale_warn_about_trailing_blank_lines = 1
    let g:ale_warn_about_trailing_whitespace = 1
    nmap ]a <ESC>:ALENextWrap<CR>
    nmap [a <ESC>:ALEPreviousWrap<CR>
    xmap ]a <ESC>:ALENextWrap<CR>
    xmap [a <ESC>:ALEPreviousWrap<CR>
    let g:ale_echo_msg_info_str = "I"
    let g:ale_echo_msg_warning_str = "W"
    let g:ale_echo_msg_error_str = "E"
    let g:ale_echo_msg_format = '[%severity% %linter%] %s'
    let g:ale_fixers = {'python': ['black']}
    let g:ale_linters = {'python': ['pyflakes']}
Plug 'lervag/vimtex', {'for': 'tex'}
    let g:vimtex_compiler_progname = 'nvr'
    let g:vimtex_view_mode='zathura'
    let g:vimtex_view_method='zathura'
    let g:vimtex_viewer_general='zathura'
    let g:vimtex_compiler_latexmk = {'build_dir': 'build'}
    let g:vimtex_fold_enabled = 1
    let g:vimtex_view_automatic = 0
    let g:tex_flavor = 'lualatex'
    let g:vimtex_quickfix_mode = 1
    let g:vimtex_complete_close_braces = 1
    let g:vimtex_complete_recursive_bib = 1
    autocmd BufReadPre *.tex let b:vimtex_main = 'main.tex'
Plug '907th/vim-auto-save'
    let g:auto_save_events = ['InsertLeave', 'TextChanged']
    let g:auto_save = 1
    let g:auto_save_silent = 1
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'preservim/nerdtree'
    map <leader>t :NERDTreeToggle<CR>
Plug 'Raimondi/delimitMate'
Plug 'cespare/vim-toml'
call plug#end()

" general options
" ---------------
set lazyredraw
set notimeout
set ttimeout
set ttimeoutlen=10

set splitright
set splitbelow

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
set listchars=tab:\|-,trail:␣, "eol:↵,space:␣,
set wrap
set linebreak
let &showbreak="→"
hi NonText ctermfg=7 cterm=none

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
let &undodir = expand("~/.cache/vim/undo/")
set undofile

" global swap dir
if empty(glob("~/.cache/vim/swap/"))
    silent execute '!mkdir -p ~/.cache/vim/swap/'
endif
set directory^=~/.cache/vim/swap/
set swapfile

syntax enable
set background=dark
colorscheme nord
let g:airline_theme='nord'
syntax on

let g:limelight_conceal_ctermfg = '8'

highlight Pmenu      cterm=none ctermbg=none ctermfg=none
set       nocursorline
highlight CursorLine cterm=none ctermbg=none ctermfg=none
highlight SpellBad   cterm=bold ctermfg=1 ctermbg=none
highlight SpellCap   cterm=bold ctermfg=3 ctermbg=none
highlight Conceal    cterm=none ctermbg=none ctermfg=none
highlight Visual     cterm=none ctermbg=7    ctermfg=0

" highlight ALEError       cterm=none ctermbg=1
" highlight ALEErrorSign   cterm=none      ctermfg=none ctermbg=1
" highlight ALEWarning     cterm=none ctermbg=3
" highlight ALEWarningSign cterm=none      ctermfg=none ctermbg=3

" highlight LineNr cterm=italic

" python
highlight pythonSelf ctermfg=4
highlight Exception ctermfg=3

highlight todo ctermbg=none ctermfg=3
match todo /[Tt][Oo][Dd][Oo]/
highlight Debug ctermfg=3 cterm=bold
match Debug /breakpoint()/

" key remap
" ---------
" map <Leader> \
inoremap jk <ESC>

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
