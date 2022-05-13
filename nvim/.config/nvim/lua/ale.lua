local g = vim.g

g.ale_fix_on_save = 1
g.ale_fixers = {
	python = { "black" },
}
