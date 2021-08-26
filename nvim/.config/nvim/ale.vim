let g:python3_host_prog = '~/.local/miniconda3/envs/nvim/bin/python'

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

let g:ale_fixers = {'python': ['black'], 'rust': ['rustfmt'], 'sh': ['shfmt']}
let g:ale_sh_shfmt_options = '-i 4'

let g:ale_linters = {'python': ['pyflakes'], 'rust': ['cargo', 'rls', 'clippy', 'analyzer']}

let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_autoimport = 1

nmap <F8> <Plug>(ale_fix)
nmap ]a <ESC>:ALENextWrap<CR>
xmap ]a <ESC>:ALENextWrap<CR>
nmap [a <ESC>:ALEPreviousWrap<CR>
xmap [a <ESC>:ALEPreviousWrap<CR>
