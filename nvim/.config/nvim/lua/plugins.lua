---@diagnostic disable: undefined-global

return require("packer").startup({
	function()
		use({ "wbthomason/packer.nvim" }) -- packer can manage itself
		use({ "nvim-lua/plenary.nvim" })

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
			config = function()
				require("user/lspconfig")
				require("mason").setup({
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "→",
							package_uninstalled = "✗",
						},
					},
				})
				require("mason-lspconfig").setup()
			end,
		})

		use({ "junegunn/fzf", run = ":call fzf#install()" })
		use({ "junegunn/fzf.vim" })

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
