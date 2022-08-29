require("ale")

require("formatter").setup({
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		python = {
			require("formatter.filetypes.python").isort,
			require("formatter.filetypes.python").black,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

require("nvim-treesitter.configs").setup({})

require("user/lspconfig")
require("user/snip")

require("mason").setup()
require("mason-lspconfig").setup()
