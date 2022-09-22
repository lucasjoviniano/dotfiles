vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
    integrations = {
        markdown = true,
        cmp = true,
        notify = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
    },
})
