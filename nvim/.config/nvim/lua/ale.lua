local g = vim.g

g.ale_fix_on_save = 1
g.ale_lint_on_enter = 1
g.ale_lint_on_save = 1
g.ale_lint_on_text_changed = "normal"

g.ale_sign_error = "??"
g.ale_sign_warning = "!?"
g.ale_sign_info = "--"
g.ale_sign_column_always = 0

g.ale_echo_msg_info_str = "I"
g.ale_echo_msg_warning_str = "W"
g.ale_echo_msg_error_str = "E"
g.ale_echo_msg_format = "[%severity% %linter%] %s"

g.ale_fixers = {
	html = "prettier",
	json = "prettier",
	lua = "stylua",
	php = "phpcbf",
	python = "black",
	rust = "rustfmt",
	sh = "shfmt",
	yaml = "prettier",
	zig = "zigfmt",
}

g.ale_fixers["*"] = { "trim_whitespace", "remove_trailing_lines" }

g.ale_linters = {
	lua = "stylua",
	php = "phpcbf",
	python = { "flake8", "pyflakes" },
	rust = "clippy",
}
