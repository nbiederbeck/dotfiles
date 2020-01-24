" load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif
" load nvim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('/scratch/nbiederbeck/vim/plugged')
Plug 'vim-airline/vim-airline'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#ale#enabled = 1
Plug 'altercation/vim-colors-solarized'
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'juliaeditorsupport/julia-vim'
" Plug 'python-mode/python-mode', {'for': 'python'}
    " let g:pymode_lint = 0
    " let g:pymode_rope = 0
    " let g:pymode_folding = 0
    " let g:pymode_options_max_line_length = 88
Plug 'justinmk/vim-sneak'
" Plug 'blueyed/vim-diminactive'
    "     let g:diminactive_use_colorcolumn = 0
    "     let g:diminactive_use_syntax = 1
Plug 'itchyny/calendar.vim'
    let g:calendar_google_calendar = 1
" Plug 'maximbaz/lightline-ale'
    set laststatus=2
    set noshowmode
Plug 'xolox/vim-reload'
Plug 'xolox/vim-misc'
Plug 'kien/rainbow_parentheses.vim'
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
Plug 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = '<C-n>'
Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
    let g:UltiSnipsSnippetDirectories = ["mysnippets", "UltiSnips"]
    let g:UltiSnipsEditSplit = "vertical"
Plug 'honza/vim-snippets'
Plug 'rbonvall/snipmate-snippets-bib', {'for': 'bib'}
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
    let g:python_host_prog = "/usr/bin/python2"
    let g:python3_host_prog = "/opt/anaconda/bin/python"
    " if matchstr(hostname(), 'vollmond') == 'vollmond'
    "     let g:python3_host_prog = "/scratch/nbiederbeck/conda/envs/py37/bin/python"
    " endif
    " if matchstr(hostname(), 'phobos') == 'phobos'
    "     let g:python3_host_prog = "/scratch/nbiederbeck/conda/envs/py37/bin/python"
    " endif
    let g:deoplete#enable_at_startup = 1
Plug 'zchee/deoplete-jedi', {'for': 'python'}
" Plug 'neomake/neomake'
Plug 'dense-analysis/ale'
    let g:ale_sign_error = 'E'
    let g:ale_sign_warning = 'W'
    let g:ale_sign_column_always = 1
    let g:ale_lint_on_text_changed = 'normal' " 'normal'/'never'
    let g:ale_lint_on_enter = 1
    let g:ale_lint_on_save = 1
    let g:ale_fix_on_save = 1
    " let g:ale_warn_about_trailing_blank_lines = 0
    " let g:ale_warn_about_trailing_whitespace = 0
    nmap ]a <ESC>:ALENextWrap<CR>
    nmap [a <ESC>:ALEPreviousWrap<CR>
    xmap ]a <ESC>:ALENextWrap<CR>
    xmap [a <ESC>:ALEPreviousWrap<CR>
    " let g:ale_linters_explicit = 1
    " let g:ale_set_loclist = 1
    " let g:ale_set_quickfix = 0
    let g:ale_echo_msg_info_str = "I"
    let g:ale_echo_msg_warning_str = "W"
    let g:ale_echo_msg_error_str = "E"
    let g:ale_echo_msg_format = '[%linter%] %s'
Plug 'lervag/vimtex', {'for': 'tex'}
    let g:vimtex_compiler_progname = 'nvr'
    let g:vimtex_view_mode='zathura'
    let g:vimtex_view_method='zathura'
    let g:vimtex_viewer_general='zathura'
    let g:vimtex_compiler_latexmk = {'build_dir': 'build'}
    let g:vimtex_fold_enabled = 1
    let g:vimtex_view_automatic = 0
    let g:tex_flavor = 'latex'
    let g:vimtex_quickfix_mode = 0
    let g:vimtex_complete_close_braces = 1
    let g:vimtex_complete_recursive_bib = 1
    autocmd BufReadPre *.tex let b:vimtex_main = 'main.tex'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'noahhdf/siunitx-conceal.vim', {'for': 'tex'}
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
    map <Leader>\ <plug>NERDTreeTabsToggle<CR>
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-easy-align'
    nmap ga <Plug>(EasyAlign)
    xmap ga <Plug>(EasyAlign)
Plug 'junegunn/limelight.vim'
Plug 'Raimondi/delimitMate'
Plug 'terryma/vim-multiple-cursors'
Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter'
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
    let g:vim_markdown_folding_disabled=1
Plug 'vimwiki/vimwiki', {'for': 'vimwiki'}
Plug 'vim-scripts/vim-on-write'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'noahhdf/vim-agriculture'
    vmap <Leader>/ <Plug>RgRawVisualSelection
    nmap <Leader>/ <Plug>RgRawWordUnderCursor
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}
" Plug 'mhartington/nvim-typescript', {'do': './install.sh', 'for': 'typescript'}
Plug 'rhysd/vim-grammarous'
" Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
    let g:nord_italic=1
    let g:nord_italic_comments=1
    let g:nord_cursor_line_number_background=0
    let g:nord_uniform_diff_background=1
Plug 'morhetz/gruvbox'
    let g:gruvbox_contrast_light = 'hard'
Plug '907th/vim-auto-save'
    let g:auto_save_events = ['InsertLeave', 'TextChanged']
    let g:auto_save = 1
    let g:auto_save_silent = 1
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'ntpeters/vim-better-whitespace'
    let g:strip_whitespace_on_save = 1
    let g:better_whitespace_enabled = 1
    let g:strip_whitelines_at_eof = 1
    let g:show_spaces_that_precede_tabs = 1
    let g:better_whitespace_verbosity = 0
    let g:strip_whitespace_confirm = 0
Plug 'christoomey/vim-tmux-navigator'
Plug 'pest-parser/pest.vim'
call plug#end()

call deoplete#custom#option('sources', {'_': ['ale']})
