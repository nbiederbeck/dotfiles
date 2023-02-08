-- Formatting
-- https://github.com/mhartington/formatter.nvim
local formatter = require("formatter")
local ft = require("formatter.filetypes")

-- Set custom options
function isort()
	return {
		-- exe = vim.fn.stdpath("data") .. "/venv/bin/isort",
		exe = "isort",
		args = { "--profile=black", "-q", "-" },
		stdin = true,
	}
end

function black()
	return {
		-- exe = vim.fn.stdpath("data") .. "/venv/bin/black",
		exe = "black",
	}
end

function snakefmt()
	return {
		exe = "snakefmt",
	}
end

function shfmt()
	return {
		exe = "shfmt",
		args = { "-i 4", "-w" },
	}
end

-- Set up all formatters
formatter.setup({
	logging = false,
	filetype = {
		lua = {
			ft.lua.stylua,
		},
		python = {
			isort,
			black,
		},
		sh = {
			shfmt,
		},
		zsh = {
			shfmt,
		},
		rust = {
			ft.rust.rustfmt,
		},
		snakemake = {
			snakefmt,
		},
		["*"] = {
			ft.any.remove_trailing_whitespace,
		},
	},
})

-- Format on save
vim.cmd([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]])
