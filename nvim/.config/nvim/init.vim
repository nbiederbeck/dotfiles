set runtimepath^=~/.vim
set runtimepath+=~/.vim/after
set runtimepath+=~/.config/nvim
let &packpath = &runtimepath

source ~/.config/nvim/plugin/plugins.vim
source ~/.vimrc
