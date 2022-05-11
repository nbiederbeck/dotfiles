local fn = vim.fn

local nvim_home = fn.expand('$NVIM_HOME')
if nvim_home == '$NVIM_HOME' then
	nvim_home = fn.stdpath('data')
end

local install_path = nvim_home..'/site/pack/packer/start/packer.nvim'
print(nvim_home)

if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


