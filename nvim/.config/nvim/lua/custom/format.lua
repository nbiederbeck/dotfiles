-- Formatting
-- https://github.com/mhartington/formatter.nvim
local formatter = require("formatter")
local ft = require("formatter.filetypes")

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
		markdown = {
			ft.markdown.prettier,
		},
		lua = {
			ft.lua.stylua,
		},
		python = {
			function()
				return {
					exe = "ruff",
					args = { "--fix", "--select", "Q,COM,I" },
				}
			end,
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
			function()
				return {
					exe = "snakefmt",
				}
			end,
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
vim.api.nvim_create_autocmd("BufWritePost", { command = "Format" })
