local flake8 = require("lint.linters.flake8")
flake8.args = {
	"--extend-ignore=E402",
	"--max-line-length=88",
}

require("lint").linters_by_ft = {
	python = { flake8 },
	tex = { "chktex" },
	sh = { "shellcheck" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
