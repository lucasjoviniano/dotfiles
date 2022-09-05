local null_ls = require("null-ls")

local is_ruby = function(path)
	return string.match(path, ".rb$") == ".rb"
end

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.elm_format,
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.rubocop,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.diagnostics.fish,
		null_ls.builtins.diagnostics.rubocop,
		null_ls.builtins.diagnostics.staticcheck,
		null_ls.builtins.diagnostics.tsc,
		null_ls.builtins.formatting.mix,
		null_ls.builtins.diagnostics.credo,
		null_ls.builtins.formatting.clang_format,
	},
})

vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("FormatOnSave", {}),
	pattern = { "*.ex", "*.exs", "*.go", "*.rs", "*.rb", "*.lua" },
	callback = function()
		vim.lsp.buf.formatting_seq_sync()
	end,
})

local mappings = {
	{ "n", "<leader>ca", vim.lsp.buf.code_action },
	{
		"n",
		"<leader>af",
		function()
			vim.lsp.buf.formatting_seq_sync({}, 4200)
		end,
	},
}
for _, mapping in pairs(mappings) do
	vim.keymap.set(unpack(mapping))
end
