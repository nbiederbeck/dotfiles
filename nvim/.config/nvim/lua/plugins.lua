-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function()
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }
    use { 'ms-jpq/coq.thirdparty' , requires = { 'ms-jpq/coq_nvim' } }
    use { 'airblade/vim-gitgutter' }
    use { 'vim-airline/vim-airline', requires = { 'vim-airline/vim-airline-themes' } }
    use { 'nvim-treesitter/nvim-treesitter' }
end)
