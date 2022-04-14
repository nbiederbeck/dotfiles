local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
    -- packer can manage itself
    use { 'wbthomason/packer.nvim' }

    -- lsp / completion
    use { 'ms-jpq/coq.thirdparty' , requires = { 'ms-jpq/coq_nvim' } }
    use { 'nvim-treesitter/nvim-treesitter' , run = ':TSUpdate' }
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

    if packer_bootstrap then
      require('packer').sync()
    end
end)
