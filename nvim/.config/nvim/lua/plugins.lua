require("bootstrap")

---@diagnostic disable: undefined-global

return require("packer").startup({
	function()
		-- packer can manage itself
		use({ "wbthomason/packer.nvim" })
		use({ "morhetz/gruvbox" })
		use({ "tpope/vim-commentary" })

		use({ "dense-analysis/ale", opt = true })
		use({ "lervag/vimtex", ft = "tex" })

		use({ "nvim-lualine/lualine.nvim" })

		-- use {
		-- 	"williamboman/nvim-lsp-installer",
		-- 	{
		-- 		"neovim/nvim-lspconfig",
		-- 		config = function()
		-- 			require("nvim-lsp-installer").setup {
		-- 				ensure_installed = { "sumneko_lua", "jedi_language_server" };
		-- 				automatic_installation = false,
		-- 			}
		-- 			local lspconfig = require("lspconfig")
		-- 			lspconfig.sumneko_lua.setup {}
		-- 			lspconfig.jedi_language_server.setup {}
		-- 		end
		-- 	}
		-- }

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
