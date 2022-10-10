---@diagnostic disable: undefined-global

return require("packer").startup({
	function()
		use({ "wbthomason/packer.nvim" }) -- packer can manage itself

		use({ "arcticicestudio/nord-vim" }) -- greatest colorscheme of all time
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

		-- use({ "dense-analysis/ale" })
		use({ ft = "tex", "lervag/vimtex" })
		use({ ft = "zig", "ziglang/zig.vim" })
		use({ "snakemake/snakemake", rtp = "misc/vim" })

		use({ "sirver/UltiSnips" })
		use({ "honza/vim-snippets" })
		use({ "ervandew/supertab" })

		use({ "vim-airline/vim-airline" })

		use({ "mhartington/formatter.nvim" })
		use({ "mfussenegger/nvim-lint" })

		use({ "Pocco81/auto-save.nvim" })

		-- use({
		--     "williamboman/nvim-lsp-installer",
		--     {
		--         "neovim/nvim-lspconfig",
		--         config = function()
		--             require("nvim-lsp-installer").setup()
		--             local lspconfig = require("lspconfig")
		--             local coq = require("coq")
		--             lspconfig.sumneko_lua.setup(coq.lsp_ensure_capabilities({}))
		--             lspconfig.jedi_language_server.setup(coq.lsp_ensure_capabilities({}))
		--             lspconfig.psalm.setup(coq.lsp_ensure_capabilities({}))
		--         end,
		--     },
		-- })

		use({
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		})

		use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } })
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

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
