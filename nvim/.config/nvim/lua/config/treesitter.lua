require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    sync_install = false,
    highlight = { enable = true, additional_vim_regex_highlighting = false },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<leader>is",
            node_incremental = "+",
            scope_incremental = "w",
            node_decremental = "-",
        },
    },
})
