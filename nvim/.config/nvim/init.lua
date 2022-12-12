local opt = vim.opt
opt.background = "light"

local cmd = vim.cmd
cmd("filetype plugin indent on")

cmd("colorscheme gruvbox")

require("impatient")
require("bootstrap")
require("plugins")
require("options")

vim.g.mapleader = " "
vim.b.dispatch = "./%"

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
map("n", "<LEADER>b", "<CMD>Buffers<CR>", {})
