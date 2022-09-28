local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspkind = require("lspkind")

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end)
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end)
			vim.keymap.set("n", "<leader>vws", function()
				vim.lsp.buf.workspace_symbol()
			end)
			vim.keymap.set("n", "<leader>vd", function()
				vim.diagnostic.open_float()
			end)
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.goto_next()
			end)
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.goto_prev()
			end)
			vim.keymap.set("n", "<leader>vca", function()
				vim.lsp.buf.code_action()
			end)
			vim.keymap.set("n", "<leader>vco", function()
				vim.lsp.buf.code_action({
					filter = function(code_action)
						if not code_action or not code_action.data then
							return false
						end

						local data = code_action.data.id
						return string.sub(data, #data - 1, #data) == ":0"
					end,
					apply = true,
				})
			end)
			vim.keymap.set("n", "<leader>vrr", function()
				vim.lsp.buf.references()
			end)
			vim.keymap.set("n", "<leader>vrn", function()
				vim.lsp.buf.rename()
			end)
			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end)
		end,
	}, _config or {})
end

require("lspconfig").ocamllsp.setup(config())

require("lspconfig").hls.setup(config({
	filetypes = { "haskell", "lhaskell", "hs" },
}))

require("lspconfig").elixirls.setup(config({
	cmd = { "/home/lucasjoviniano/elixir-ls/language_server.sh" },
}))

require("lspconfig").clangd.setup(config())

require("lspconfig").r_language_server.setup(config())

require("lspconfig").pyright.setup(config())

require("lspconfig").solargraph.setup(config())

--require("lspconfig").typeprof.setup(config())

function go_org_imports(wait_ms)
	local params = vim.lsp.util.make_range_params()
	params.context = { only = { "source.organizeImports" } }
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
	for cid, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
				vim.lsp.util.apply_workspace_edit(r.edit, enc)
			end
		end
	end
end

require("lspconfig").gopls.setup(config({
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}))

vim.cmd([[autocmd BufWritePre *.go lua go_org_imports()]])

require("lspconfig").rust_analyzer.setup(config({
	cmd = { "rustup", "run", "nightly", "rust-analyzer" },
}))

local opts = {
	-- whether to highlight the currently hovered symbol
	-- disable if your cpu usage is higher than you want it
	-- or you just hate the highlight
	-- default: true
	highlight_hovered_item = true,

	-- whether to show outline guides
	-- default: true
	show_guides = true,
}

require("symbols-outline").setup(opts)

require("lspconfig").sumneko_lua.setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})
