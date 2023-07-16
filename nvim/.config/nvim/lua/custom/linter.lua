-- Linting
-- https://github.com/mfussenegger/nvim-lint
local lint = require("lint")

-- path = { ["PATH"] = vim.fn.stdpath("data") .. "/venv/bin" }

-- Set custom options
local flake8 = lint.linters.flake8
table.insert(flake8.args, 1, "--max-line-length=88")
table.insert(flake8.args, 1, "--extend-ignore=E402")

local mypy = lint.linters.mypy
table.insert(mypy.args, "--ignore-missing-imports")

local chktex = lint.linters.chktex
for _, arg in pairs({
	"-wall", -- enable all warning
	"-n22", -- disable "comment displayed"
	"-n30", -- disable "multiple spaces detected in output"
	"-e15", -- error "no match found"
	"-e16", -- error "mathmode still on at EOF"
}) do
	table.insert(chktex.args, arg)
end
-- pydocstyle.env = path

-- Set up all linters
lint.linters_by_ft = {
	rst = { "rstcheck" },
	python = { "flake8" },
	tex = { "chktex" },
	sh = { "shellcheck" },
	zsh = { "shellcheck" },
}

-- Lint on save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		lint.try_lint()
	end,
})
