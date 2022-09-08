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

" let g:ale_fix_on_save = 0
" let g:ale_lint_on_enter = 1
" let g:ale_lint_on_save = 1
" let g:ale_lint_on_text_changed = "normal"

" let g:did_load_filetypes = 0
" let g:do_filetype_lua = 1

" let g:ale_sign_error = "??"
" let g:ale_sign_warning = "!?"
" let g:ale_sign_info = "--"
" let g:ale_sign_column_always = 0

" let g:ale_echo_msg_info_str = "I"
" let g:ale_echo_msg_warning_str = "W"
" let g:ale_echo_msg_error_str = "E"
" let g:ale_echo_msg_format = "[%severity% %linter%] %s"

" let g:ale_fixers = {'*': ['trim_whitespace', 'remove_trailing_lines']}
" let g:ale_fixers.css = ['prettier']
" let g:ale_fixers.html = ['tidy', 'prettier']
" let g:ale_fixers.js = ['prettier']
" let g:ale_fixers.json = ['prettier']
" let g:ale_fixers.lua = ['stylua']
" let g:ale_fixers.php = ['phpcbf']
" let g:ale_fixers.python = ['isort', 'black']
" let g:ale_fixers.rust = ['rustfmt']
" let g:ale_fixers.sh = ['shfmt']
" let g:ale_fixers.yaml = ['prettier']
" let g:ale_fixers.zig = ['zigfmt']

" let g:ale_linters = {}
" let g:ale_linters.html = ['tidy']
" let g:ale_linters.lua = ['stylua']
" let g:ale_linters.php = ['phpcbf']
" let g:ale_linters.python = ['flake8', 'pyright']
" let g:ale_linters.rust = ['clippy']
" let g:ale_linters.sh = ['shellcheck']
" let g:ale_linters.tex = ['chktex', 'lacheck']

" let g:ale_sh_shfmt_options = '-i 4'
" let g:ale_python_isort_options = '--profile=black'
" let g:ale_python_flake8_options = '--extend-ignore=E402,E203 --max-line-length=88'

augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END

augroup UltiToggle
    autocmd!
    autocmd User UltiSnipsEnterFirstSnippet ASToggle
    autocmd User UltiSnipsExitLastSnippet ASToggle
augroup END

let g:python3_host_prog=expand('~/.local/share/nvim/venv/bin/python')
if empty(glob(g:python3_host_prog))
    echo 'create environment'
    execute '!python3 -m venv ~/.local/share/nvim/venv --prompt nvim'
    execute '!~/.local/share/nvim/venv/bin/python -m pip install pynvim'
endif
