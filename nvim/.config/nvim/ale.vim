let g:nvim_conda_path = expand('~/.local/miniconda3/envs/nvim/bin/')
let g:python3_host_prog = expand(g:nvim_conda_path..'python')

let g:ale_python_black_executable = expand(g:nvim_conda_path..'black')
let g:ale_python_isort_executable = expand(g:nvim_conda_path..'isort')
let g:ale_python_flake8_executable = expand(g:nvim_conda_path..'flake8')

let g:ale_sign_error = '??'
let g:ale_sign_warning = '!?'
let g:ale_sign_info = '--'
let g:ale_sign_column_always = 0

let g:ale_lint_on_text_changed = 'normal' " 'normal'/'never'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1

let g:ale_fix_on_save = 0

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

let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_autoimport = 1

nmap <LEADER>f <Plug>(ale_fix)
nmap ]a <ESC>:ALENextWrap<CR>
xmap ]a <ESC>:ALENextWrap<CR>
nmap [a <ESC>:ALEPreviousWrap<CR>
xmap [a <ESC>:ALEPreviousWrap<CR>

function! ToggleFixOnSave()
    if g:ale_fix_on_save == 0
        let g:ale_fix_on_save = 1
        echo 'Fix on save'
    else
        let g:ale_fix_on_save = 0
        echo 'Do not fix on save'
    endif
endfunction
command ToggleFixOnSave call ToggleFixOnSave()
