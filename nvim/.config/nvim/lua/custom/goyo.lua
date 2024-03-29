local g = vim.g
g.goyo_height = "85%"
g.goyo_width = "120"

vim.cmd([[
function! s:goyo_enter()
    if executable('tmux') && strlen($TMUX)
        silent !tmux set status off
    endif
    silent :LspStop
    silent :GitGutterDisable
    silent :set nocursorline
endfunction

function! s:goyo_leave()
    if executable('tmux') && strlen($TMUX)
        silent !tmux set status on
    endif
    silent :LspStart
    silent :GitGutterEnable
    silent :set cursorline
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
]])
