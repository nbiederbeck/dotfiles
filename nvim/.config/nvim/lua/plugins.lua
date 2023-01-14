---@diagnostic disable: undefined-global

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
				require("user/which-key")
			end,
		})

		use({ "lewis6991/impatient.nvim" })

		use({
			"arcticicestudio/nord-vim",
			config = function()
				vim.cmd("colorscheme nord")
			end,
			setup = function()
				vim.g.nord_uniform_diff_background = 1
				vim.g.nord_italic_comments = 1
			end,
		}) -- greatest colorscheme of all time
		use({ "projekt0n/github-nvim-theme" })
		use({ "morhetz/gruvbox" })
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

		-- use({ "dense-analysis/ale" })
		use({ ft = "tex", "lervag/vimtex" })
		use({ ft = "zig", "ziglang/zig.vim" })
		use({ "snakemake/snakemake", rtp = "misc/vim" })

		use({ "sirver/UltiSnips" })
		use({ "honza/vim-snippets" })
		use({ "ervandew/supertab" })

		use({
			"vim-airline/vim-airline",
			config = function()
				vim.cmd("let g:airline#extensions#ale#enabled = 1")
			end,
		})

		use({
			"mhartington/formatter.nvim",
			config = function()
				require("user/format")
			end,
		})
		use({
			"mfussenegger/nvim-lint",
			config = function()
				require("user/linter")
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

		use({ "junegunn/fzf", run = ":call fzf#install()" })
		use({ "junegunn/fzf.vim" })

		use({ -- LSP Configuration & Plugins
			"neovim/nvim-lspconfig",
			requires = {
				-- Automatically install LSPs to stdpath for neovim
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",

				-- Useful status updates for LSP
				"j-hui/fidget.nvim",

				-- Additional lua configuration, makes nvim stuff amazing
				"folke/neodev.nvim",
			},
		})

		use({ -- Autocompletion
			"hrsh7th/nvim-cmp",
			requires = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
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
		use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" } })

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
	},
	autoremove = true,
})
