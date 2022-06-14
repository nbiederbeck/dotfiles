local g = vim.g

g.ale_fix_on_save = 1

g.ale_fixers = {
	python = "black",
	rust = "rustfmt",
	zig = "zigfmt",
	lua = "stylua",
	yaml = "prettier",
	html = "prettier",
	json = "prettier",
	php = "phpcbf",
	sh = "shfmt",
}

g.ale_fixers["*"] = { "trim_whitespace", "remove_trailing_lines" }

g.ale_linters = { php = "phpcbf", rust = "clippy", lua = "stylua" }
