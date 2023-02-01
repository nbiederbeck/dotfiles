local g = vim.g

g.ale_use_neovim_diagnostics_api = 1
g.ale_lint_on_text_changed = 1
g.ale_fix_on_save = 1

-- Linters
g.ale_linters = {
	python = { "flake8" },
	tex = { "chktex" },
	sh = { "shellcheck" },
	zsh = { "shellcheck" },
}
-- Linter Options
g.ale_python_flake8_options = "--max-line-length=88 --extend-ifnore=E402"

-- Fixers
g.ale_fixers = {
	python = { "isort", "black" },
	lua = { "stylua" },
	sh = { "shfmt" },
	zsh = { "shfmt" },
	rust = { "rustfmt" },
	snakemake = { "snakefmt" },
	["*"] = { "remove_trailing_lines", "trim_whitespace" },
}
-- Fixer options
g.ale_sh_shfmt_options = "-i 4"
g.ale_python_isort_options = "--profile=black"
