-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function()
    -- packer can manage itself
    use { 'wbthomason/packer.nvim' }

    -- lsp / completion
    use { 'ms-jpq/coq.thirdparty' , requires = { 'ms-jpq/coq_nvim' } }
    use { 'nvim-treesitter/nvim-treesitter' }
    use { 'neovim/nvim-lspconfig' }

    -- ux
    use { 'airblade/vim-gitgutter' }
    use { 'tpope/vim-repeat' }
    use { 'tpope/vim-surround' }
    use { 'tpope/vim-commentary' }
    use { 'tpope/vim-fugitive' }

    -- ui
    use { 'vim-airline/vim-airline',
        requires = { 'vim-airline/vim-airline-themes' },
    }
    -- language support
    use { 'ziglang/zig.vim' }
    use { 'dag/vim-fish' }
    use { 'cespare/vim-toml' }
    use { 'JuliaEditorSupport/julia-vim' }
end)
