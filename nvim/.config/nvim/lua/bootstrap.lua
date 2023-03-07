vim.g.python3_host_prog = vim.fn.expand("~/.local/share/nvim/venv/bin/python")

vim.cmd([[
if empty(glob(g:python3_host_prog))
    echo 'create environment'
    execute '!python3 -m venv ~/.local/share/nvim/venv --prompt nvim'
    execute '!~/.local/share/nvim/venv/bin/python -m pip install --upgrade pip pynvim'
endif
]])

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
