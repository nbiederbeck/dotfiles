-- Formatting
-- https://github.com/mhartington/formatter.nvim
local formatter = require("formatter")
local ft = require("formatter.filetypes")

-- Set custom options
function isort()
	return {
		exe = "isort",
		args = { "--profile=black", "-q", "-" },
		stdin = true,
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
			ft.sh.shfmt,
		},
		zsh = {
			ft.sh.shfmt,
		},
		rust = {
			ft.rust.rustfmt,
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
