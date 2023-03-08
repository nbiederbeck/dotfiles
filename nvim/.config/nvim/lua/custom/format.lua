-- Formatting
-- https://github.com/mhartington/formatter.nvim
local formatter = require("formatter")
local ft = require("formatter.filetypes")

local function isort()
	return {
		exe = "isort",
		args = { "--profile=black" },
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
			isort,
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
