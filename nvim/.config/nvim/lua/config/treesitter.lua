require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"css",
		"dockerfile",
		"fish",
		"go",
		"gomod",
		"html",
		"javascript",
		"json",
		"lua",
		"python",
		"regex",
		"rust",
		"toml",
		"yaml",
    "elixir"
	},
	highlight = { enable = true, disable = {} },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<leader>is",
			node_incremental = "+",
			scope_incremental = "w",
			node_decremental = "-",
		},
	},
	indent = { enable = true },
	endwise = { enable = true },
})
