-- Formatting
-- https://github.com/mhartington/formatter.nvim
local formatter = require("formatter")
local ft = require("formatter.filetypes")

local function ruff()
	return {
		exe = "ruff",
		args = { "--select=I", "--fix" },
	}
end

local function snakefmt()
	return {
		exe = "snakefmt",
	}
end

local function shfmt()
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
			ruff,
			ft.python.black,
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
