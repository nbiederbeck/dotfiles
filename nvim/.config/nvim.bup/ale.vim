let venv = expand('~/.local/conda/envs/nvim')
let venv_bin = venv.'/bin/'
if empty(glob(venv))
    echo 'Creating conda environment ...'
    silent execute '!mamba create -yqn nvim python=3.9 pynvim black flake8 isort jedi'
    echo '... done.'
endif
let g:python3_host_prog = expand(venv_bin.'python')

let g:ale_python_black_executable = expand(venv_bin.'black')
let g:ale_python_isort_executable = expand(venv_bin.'isort')
let g:ale_python_flake8_executable = expand(venv_bin.'flake8')

let g:ale_sign_error = '??'
let g:ale_sign_warning = '!?'
let g:ale_sign_info = '--'
let g:ale_sign_column_always = 0

let g:ale_lint_on_text_changed = 'normal' " 'normal'/'never'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1

let g:ale_fix_on_save = 1

let g:ale_warn_about_trailing_blank_lines = 1
let g:ale_warn_about_trailing_whitespace = 1

let g:ale_echo_msg_info_str = "I"
let g:ale_echo_msg_warning_str = "W"
let g:ale_echo_msg_error_str = "E"
let g:ale_echo_msg_format = '[%severity% %linter%] %s'

let g:ale_fixers = {'*': ['trim_whitespace', 'remove_trailing_lines']}
let g:ale_fixers.python = ['black', 'isort']
let g:ale_fixers.rust = ['rustfmt']
let g:ale_fixers.sh = ['shfmt']
let g:ale_fixers.json = ['prettier']
let g:ale_fixers.html = ['tidy', 'prettier']
let g:ale_fixers.css = ['prettier']
let g:ale_fixers.js = ['prettier']
let g:ale_fixers.php = ['php_cs_fixer']

let g:ale_linters = {}
let g:ale_linters.python = ['flake8']
let g:ale_linters.rust = ['analyzer', 'clippy']
let g:ale_linters.sh = ['shellcheck']
let g:ale_linters.tex = ['checktex', 'lacheck']
let g:ale_linters.html = ['tidy']

let g:ale_sh_shfmt_options = '-i 4'
let g:ale_python_isort_options = '--profile black'
let g:ale_python_flake8_options = '--extend-ignore=E402,E203 --max-line-length=88'
" E203 whitespace before ':'
" E402 module level import not at top of file

set omnifunc=ale#completion#OmniFunc
let g:ale_completion_autoimport = 1

nmap <LEADER>f <Plug>(ale_fix)
nmap ]a <ESC>:ALENextWrap<CR>
xmap ]a <ESC>:ALENextWrap<CR>
nmap [a <ESC>:ALEPreviousWrap<CR>
xmap [a <ESC>:ALEPreviousWrap<CR>

function! FixOnSaveToggle()
    if g:ale_fix_on_save == 0
        call FixOnSave()
    else
        call DontFixOnSave()
    endif
endfunction
function! FixOnSave()
    let g:ale_fix_on_save = 1
    echo 'Fix on save'
endfunction
function! DontFixOnSave()
    let g:ale_fix_on_save = 0
    echo 'Do not fix on save'
endfunction
command FixOnSaveToggle call FixOnSaveToggle()
command FixOnSave call FixOnSave()