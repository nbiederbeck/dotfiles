---@diagnostic disable-next-line: undefined-global
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

vim.cmd([[
let g:python3_host_prog=expand('~/.local/share/nvim/venv/bin/python')
if empty(glob(g:python3_host_prog))
    echo 'create environment'
    execute '!python3 -m venv ~/.local/share/nvim/venv --prompt nvim'
    execute '!~/.local/share/nvim/venv/bin/python -m pip install --upgrade pip pynvim black flake8 isort'
endif

]])
