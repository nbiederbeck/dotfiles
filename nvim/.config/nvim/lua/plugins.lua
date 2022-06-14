require("bootstrap")

---@diagnostic disable: undefined-global

return require("packer").startup({
	function()
		use({ "wbthomason/packer.nvim" }) -- packer can manage itself

		use({ "arcticicestudio/nord-vim" })
		use({ "airblade/vim-gitgutter" })

		use({ "tpope/vim-commentary" })
		use({ "tpope/vim-surround" })
		use({ "tpope/vim-repeat" })
		use({ "tpope/vim-fugitive" })

		use({ "dense-analysis/ale" })
		use({ ft = "tex", "lervag/vimtex" })
		use({ ft = "zig", "ziglang/zig.vim" })

		use({ "nvim-lualine/lualine.nvim" })

		use({ "ms-jpq/coq_nvim", branch = "coq" })
		use({ "ms-jpq/coq.artifacts", branch = "artifacts" })
		-- use({
		--     "williamboman/nvim-lsp-installer",
		--     {
		--         "neovim/nvim-lspconfig",
		--         config = function()
		--             require("nvim-lsp-installer").setup()
		--             local lspconfig = require("lspconfig")
		--             local coq = require("coq")
		--             lspconfig.sumneko_lua.setup(coq.lsp_ensure_capabilities({}))
		--             lspconfig.jedi_language_server.setup(coq.lsp_ensure_capabilities({}))
		--             lspconfig.psalm.setup(coq.lsp_ensure_capabilities({}))
		--         end,
		--     },
		-- })

		if PACKER_BOOTSTRAP then
			require("packer").sync()
		end
	end,
	config = {
		profile = {
			enable = true,
		},
	},
	autoremove = true,
})
