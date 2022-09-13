local g = vim.g
g.UltiSnipsExpandTrigger = "<tab>"
g.UltiSnipsJumpForwardTrigger = "<tab>"

-- Do not autosave while expanding snippets
vim.cmd([[
augroup UltiToggle
    autocmd!
    autocmd User UltiSnipsEnterFirstSnippet ASToggle
    autocmd User UltiSnipsExitLastSnippet ASToggle
augroup END
]])

-- Some options
vim.cmd([[
let g:UltiSnipsSnippetDirectories=[expand('~/.config/nvim/mysnippets')]
let g:UltiSnipsEditSplit="vertical"
map <LEADER>s :UltiSnipsEdit<CR>
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
]])
