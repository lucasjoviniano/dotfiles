require("nvim-tree").setup({
	view = {
		side = "right",
	},
})

require("remap").nnoremap("<leader>e", "<cmd>NvimTreeToggle<CR>")
