-- Linting
-- https://github.com/mfussenegger/nvim-lint
local lint = require("lint")

-- path = { ["PATH"] = vim.fn.stdpath("data") .. "/venv/bin" }

-- Set custom options
local flake8 = lint.linters.flake8
-- flake8.env = path
table.insert(flake8.args, 1, "--max-line-length=88")
table.insert(flake8.args, 1, "--extend-ignore=E402")

local pydocstyle = lint.linters.pydocstyle
pydocstyle.args = { "--convention=numpy", "--add-select=D417" }
-- pydocstyle.env = path

-- Set up all linters
lint.linters_by_ft = {
	python = { "flake8" },
	tex = { "chktex" },
	sh = { "shellcheck" },
	zsh = { "shellcheck" },
}

-- Lint on save
vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
	callback = function()
		lint.try_lint()
	end,
})
