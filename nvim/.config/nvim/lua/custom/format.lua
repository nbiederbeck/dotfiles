-- Formatting
-- https://github.com/mhartington/formatter.nvim
local formatter = require("formatter")
local ft = require("formatter.filetypes")

local function ruff()
	return {
		exe = "ruff",
		args = { "--select=F,E,W,I,N,PL", "--fix" },
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
		yaml = {
			ft.yaml.prettier,
		},
		snakemake = {
			snakefmt,
		},
		json = {
			ft.json.prettier,
		},
		["*"] = {
			ft.any.remove_trailing_whitespace,
		},
	},
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePost", { command = "FormatWrite" })
