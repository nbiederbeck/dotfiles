require'nvim-treesitter.configs'.setup {
    ensure_installed = { "bibtex", "comment", "css", "html", "json", "julia", "latex", "lua", "make", "php", "python", "rust", "toml", "vim", "zig" },
    indent = { enable = true },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
}
