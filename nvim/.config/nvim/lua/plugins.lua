return {
	{ "nvim-lua/plenary.nvim" },

	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup()
			require("custom/which-key")
		end,
	},

	{
		"arcticicestudio/nord-vim", -- greatest colorscheme of all time
		init = function()
			vim.g.nord_uniform_diff_background = 1
			vim.g.nord_italic_comments = 1
			vim.cmd("colorscheme nord")
		end,
	},

	{
		"airblade/vim-gitgutter",
		config = function()
			vim.g.gitgutter_highlight_linenrs = 1
		end,
	},

	{ "kshenoy/vim-signature" }, -- show vim marks
	{ "lukas-reineke/indent-blankline.nvim" }, -- show indentlines
	{ "christoomey/vim-tmux-navigator" }, -- seamlessly work with tmux and vim splits

	{ "tpope/vim-commentary" }, -- gcc for commenting
	{ "tpope/vim-surround" },
	{ "tpope/vim-repeat" },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-dispatch" },

	{
		"lervag/vimtex",
		ft = "tex",
		config = function()
			vim.g.vimtex_compiler_latexmk = { continuous = 0 }
		end,
	},

	{
		"ziglang/zig.vim",
		ft = "zig",
	},

	{
		"snakemake/snakemake",
		ft = "snakemake",
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/misc/vim/")
		end,
		init = function()
			vim.opt.foldenable = false
		end,
	},

	{
		"sirver/UltiSnips",
		config = function()
			require("custom/snip")
		end,
		dependencies = {
			"honza/vim-snippets",
			"ervandew/supertab",
		},
	},

	{
		"vim-airline/vim-airline",
		config = function()
			vim.cmd("let g:airline#extensions#ale#enabled = 1")
		end,
	},

	{
		"mhartington/formatter.nvim",
		config = function()
			require("custom/format")
		end,
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("custom/linter")
		end,
	},

	{
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
	},

	{ "junegunn/fzf", build = ":call fzf#install()", dependencies = "junegunn/fzf.vim" },
	{ "junegunn/vim-easy-align" },
	{
		"junegunn/goyo.vim",
		config = function()
			require("custom/goyo")
		end,
	},

	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ "williamboman/mason.nvim", build = ":MasonUpdate" },
			"williamboman/mason-lspconfig.nvim",

			-- ful status updates for LSP
			"j-hui/fidget.nvim",

			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",
		},
	},

	{
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			-- "L3MON4D3/LuaSnip",
			-- "saadparwaiz1/cmp_luasnip",
		},
	},

	{
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	},

	{
		-- Additional text objects via treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	},

	-- Fuzzy Finder (files, lsp, etc)
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		pin = true,
	},

	-- Fuzzy Finder Algorithm which dependencies local dependencies to be built. Only load if `make` is available
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = vim.fn.executable("make") == 1,
	},
}
