require("user/lspconfig")
require("user/snip")

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

require("user/linter")
require("user/format")

require("user/telescope")
