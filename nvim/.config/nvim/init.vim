set runtimepath^=~/.vim
set runtimepath+=~/.vim/after
set runtimepath+=~/.config/nvim
let &packpath = &runtimepath

source ~/.config/nvim/plugin/plugins.vim
source ~/.vim/vimrc

set popt=syntax:y,number:y,header:1
" command! -range=% PDF <line1>,<line2> hardcopy > %.ps | silent !ps2pdf %.ps %.pdf

function PDF()
    hardcopy > %.ps
    silent !ps2pdf %.ps %.pdf
    " silent !pdfcrop %.pdf %.pdf
endfunction

command! PDF call PDF()
