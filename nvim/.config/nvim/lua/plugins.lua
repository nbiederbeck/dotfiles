---@diagnostic disable: undefined-global
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

vim.g.python3_host_prog = vim.fn.expand("~/.local/share/nvim/venv/bin/python")

vim.cmd([[
if empty(glob(g:python3_host_prog))
    echo 'create environment'
    execute '!python3 -m venv ~/.local/share/nvim/venv --prompt nvim'
    execute '!~/.local/share/nvim/venv/bin/python -m pip install --upgrade pip pynvim'
endif
]])

return require("packer").startup({
	function()
		use({ "wbthomason/packer.nvim" }) -- packer can manage itself
		use({ "nvim-lua/plenary.nvim" })

		use({
			"folke/which-key.nvim",
			config = function()
				vim.o.timeout = true
				vim.o.timeoutlen = 300
				require("which-key").setup()
				require("custom/which-key")
			end,
		})

		use({
			"arcticicestudio/nord-vim", -- greatest colorscheme of all time
			config = function()
				vim.cmd("colorscheme nord")
			end,
			setup = function()
				vim.g.nord_uniform_diff_background = 1
				vim.g.nord_italic_comments = 1
			end,
		})

		use({
			"lewis6991/gitsigns.nvim", -- show git marks
			config = function()
				require("gitsigns").setup()
			end,
		})
		use({ "kshenoy/vim-signature" }) -- show vim marks
		use({ "lukas-reineke/indent-blankline.nvim" }) -- show indentlines
		use({ "christoomey/vim-tmux-navigator" }) -- seamlessly work with tmux and vim splits

		use({ "tpope/vim-commentary" }) -- gcc for commenting
		use({ "tpope/vim-surround" })
		use({ "tpope/vim-repeat" })
		use({ "tpope/vim-fugitive" })
		use({ "tpope/vim-dispatch" })

		use({
			"sindrets/diffview.nvim",
			config = function()
				require("diffview").setup({ use_icons = false })
			end,
		})

		use({
			"lervag/vimtex",
			ft = "tex",
			config = function()
				vim.g.vimtex_compiler_latexmk = { continuous = 0 }
			end,
		})

		use({
			"ziglang/zig.vim",
			ft = "zig",
		})

		use({
			"snakemake/snakemake",
			ft = "snakemake",
			rtp = "misc/vim",
		})

		use({
			"sirver/UltiSnips",
			config = function()
				require("custom/snip")
			end,
			requires = {
				"honza/vim-snippets",
				"ervandew/supertab",
			},
		})

		use({
			"vim-airline/vim-airline",
			config = function()
				vim.cmd("let g:airline#extensions#ale#enabled = 1")
			end,
		})

		use({
			"mhartington/formatter.nvim",
			config = function()
				require("custom/format")
			end,
		})
		use({
			"mfussenegger/nvim-lint",
			config = function()
				require("custom/linter")
			end,
		})

		use({
			"Pocco81/auto-save.nvim",
			config = function()
				require("auto-save").setup({
					execution_message = {
						message = function()
							return ""
						end,
					},
				})
			end,
		})

		use({ "junegunn/fzf", run = ":call fzf#install()", requires = "junegunn/fzf.vim" })
		use({ "junegunn/vim-easy-align" })
		use({
			"junegunn/goyo.vim",
			config = function()
				require("custom/goyo")
			end,
		})

		use({ -- LSP Configuration & Plugins
			"neovim/nvim-lspconfig",
			requires = {
				-- Automatically install LSPs to stdpath for neovim
				{ "nbiederbeck/mason.nvim", branch = "snakefmt" },
				"williamboman/mason-lspconfig.nvim",

				-- Useful status updates for LSP
				"j-hui/fidget.nvim",

				-- Additional lua configuration, makes nvim stuff amazing
				"folke/neodev.nvim",
			},
		})

		use({ -- Autocompletion
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-nvim-lsp",
				-- "L3MON4D3/LuaSnip",
				-- "saadparwaiz1/cmp_luasnip",
			},
		})

		use({ -- Highlight, edit, and navigate code
			"nvim-treesitter/nvim-treesitter",
			run = function()
				pcall(require("nvim-treesitter.install").update({ with_sync = true }))
			end,
		})

		use({ -- Additional text objects via treesitter
			"nvim-treesitter/nvim-treesitter-textobjects",
			after = "nvim-treesitter",
		})
		-- Fuzzy Finder (files, lsp, etc)
		use({
			"nvim-telescope/telescope.nvim",
			tag = "*",
			lock = true,
		})

		-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable("make") == 1 })

		if PACKER_BOOTSTRAP then
			require("packer").sync()
		end
	end,
	config = {
		profile = {
			enable = true,
		},
		autoremove = true,
	},
})
