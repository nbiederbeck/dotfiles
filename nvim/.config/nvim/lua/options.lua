require("user/lint")
require("user/format")

require("nvim-treesitter.configs").setup({})

require("user/lspconfig")
require("user/snip")

require("mason").setup()
require("mason-lspconfig").setup()
