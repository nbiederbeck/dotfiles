return function(use)
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.black, -- hier :)
					null_ls.builtins.formatting.isort, -- hier :)
					null_ls.builtins.diagnostics.eslint,
					null_ls.builtins.completion.spell,
				},
			})
		end,
	})
end
