-- Linting
-- https://github.com/mfussenegger/nvim-lint
local lint = require("lint")

-- Set custom options
local flake8 = lint.linters.flake8
table.insert(flake8.args, 1, "--max-line-length=88")
table.insert(flake8.args, 1, "--extend-ignore=E402")

-- Set up all linters
lint.linters_by_ft = {
	python = { "flake8" },
	tex = { "chktex" },
	sh = { "shellcheck" },
}

-- Lint on save
vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
	callback = function()
		lint.try_lint()
	end,
})