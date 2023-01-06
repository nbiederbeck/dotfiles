---@diagnostic disable-next-line: undefined-global
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

PACKER_BOOTSTRAP = ensure_packer()

vim.cmd([[
let g:python3_host_prog=expand('~/.local/share/nvim/venv/bin/python')
if empty(glob(g:python3_host_prog))
    echo 'create environment'
    execute '!python3 -m venv ~/.local/share/nvim/venv --prompt nvim'
    execute '!~/.local/share/nvim/venv/bin/python -m pip install --upgrade pip pynvim black flake8 isort'
endif
]])
