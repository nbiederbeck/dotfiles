vim.cmd("filetype plugin indent on")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("bootstrap")
require("custom/kickstart")

vim.b.dispatch = "./%"

local opt = vim.opt

opt.mouse = "a"

opt.number = true
opt.relativenumber = false
opt.cursorline = true
opt.scrolloff = 2
opt.signcolumn = "yes"

opt.expandtab = true
opt.autoindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

opt.splitbelow = true
opt.splitright = true

opt.smartcase = true
opt.ignorecase = true

local map = vim.api.nvim_set_keymap
map("i", "jk", "<ESC>", {})
map("n", "<C-J>", "<C-W>j", {})
map("n", "<C-H>", "<C-W>h", {})
map("n", "<C-K>", "<C-W>k", {})
map("n", "<C-L>", "<C-W>l", {})
map("t", "<ESC>", "<C-\\><C-n>", {})
map("n", "dol", "<CMD>diffget 4<CR>", {})
map("n", "doh", "<CMD>diffget 2<CR>", {})
map("n", "ga", "<Plug>(EasyAlign)", {})

-- silence optional providers in healthcheck
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
