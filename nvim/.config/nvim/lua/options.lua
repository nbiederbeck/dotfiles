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
		sh = {
			require("formatter.filetypes.sh").shfmt,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

require("lint").linters_by_ft = {
	python = { "flake8" },
	tex = { "chktex" },
	sh = { "shellcheck" },
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

require("nvim-treesitter.configs").setup({})

require("user/lspconfig")
require("user/snip")

require("mason").setup()
require("mason-lspconfig").setup()
