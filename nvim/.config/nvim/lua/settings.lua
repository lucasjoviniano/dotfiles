local function list(value, str, sep)
	sep = sep or ","
	str = str or ""
	value = type(value) == "table" and table.concat(value, sep) or value
	return str ~= "" and table.concat({ value, str }, sep) or value
end

local function set_mappings()
	local mappings = {
		{ "n", "<Leader>n", ":set relativenumber!<CR>" },
		-- buffer and aplist navigation
		{ "n", "<leader><leader>", "<C-^>" },
		{ "n", "<C-h>", "<C-w>h<CR>" },
		{ "n", "<C-j>", "<C-w>j<CR>" },
		{ "n", "<C-k>", "<C-w>k<CR>" },
		{ "n", "<C-l>", "<C-w>l<CR>" },
		{ "n", "<leader>Q", "<C-w>c<CR>" },
		{ "n", "<leader>w", "<Cmd>w<CR>" },
		{ "n", "<leader>z", "<Cmd>bp<CR>" },
		{ "n", "<leader>x", "<Cmd>bn<CR>" },
		{ "n", "<leader>qa", "<Cmd>bufdo bw<CR>" },
		{ "n", "<leader>q", "<Cmd>bw<CR>" },
		-- indent and keep selection
		{ "", ">", ">gv", {} },
		{ "", "<", "<gv", {} },
		-- move lines up and down
		{ "n", "<C-j>", ":m .+1<CR>==" },
		{ "n", "<C-k>", ":m .-2<CR>==" },
		{ "v", "J", ":m '>+1<CR>gv=gv" },
		{ "v", "K", ":m '<-2<CR>gv=gv" },
		-- autocomplete line and filename
		{ "i", "<C-l>", "<C-x><C-l>" },
		{ "i", "<C-f>", "<C-x><C-f>" },
		-- keep centered when n/N/J
		{ "n", "n", "nzz" },
		{ "n", "N", "Nzz" },
		{ "n", "J", "mzJ`z" },
		-- select the end of the line without linebreak
		{ "v", "$", "$h" },
		-- window splits
		{ "n", "<leader>v", "<Cmd>vsp<CR>" },
		{ "n", "<leader>s", "<Cmd>sp<CR>" },
		-- window resizes
		{ "n", "<C-M-h>", "<Cmd>vertical res -2<CR>" },
		{ "n", "<C-M-l>", "<Cmd>vertical res +2<CR>" },
		{ "n", "<C-M-j>", "<Cmd>res +1<CR>" },
		{ "n", "<C-M-k>", "<Cmd>res -1<CR>" },
		-- select all
		{ "n", "<C-A>", "ggVG" },
		{ "i", "<C-A>", "<ESC>ggVG" },
		{ "v", "<C-A>", "<ESC>ggVG" },
		-- turn off search highlight,
		{ "n", "<Esc>", "<Cmd>noh<CR>" },
	}

	for _, val in pairs(mappings) do
		vim.keymap.set(unpack(val))
	end
end

local function set_options()
	local options = {
		nu = true,
		errorbells = false,
		termguicolors = true,
		smartindent = true,
		wrap = false,
		swapfile = false,
		backup = false,
		hlsearch = false,
		incsearch = true,
		scrolloff = 8,
		signcolumn = "yes",
		cmdheight = 1,
		updatetime = 50,
		colorcolumn = "80",
		number = true,
		relativenumber = true,
		autoindent = true,
		shiftwidth = 4,
		tabstop = 4,
		softtabstop = -1,
		expandtab = true,
		ignorecase = true,
		smartcase = true,
		wildignorecase = true,
		showcmd = true,
		mouse = "a",
		hidden = true,
		cursorline = true,
		splitbelow = true,
		splitright = true,
		backspace = list({ "indent", "eol", "start" }),
	}
	for key, val in pairs(options) do
		vim.opt[key] = val
	end

	local line_numbers = vim.api.nvim_create_augroup("LineNumbers", {})
	local set_relative = { "InsertEnter", "FocusGained", "BufEnter" }
	for _, value in pairs(set_relative) do
		vim.api.nvim_create_autocmd(value, { group = line_numbers, pattern = "*", command = "set relativenumber" })
	end
	local set_non_relative = { "InsertLeave", "FocusLost", "BufLeave" }
	for _, value in pairs(set_non_relative) do
		vim.api.nvim_create_autocmd(value, { group = line_numbers, pattern = "*", command = "set norelativenumber" })
	end

	local markdown_filetypes = vim.api.nvim_create_augroup("MarkdownExtentions", {})
	local markdown_extentions = { "md", "adoc", "Rmd", "livemd" }
	for _, ext in pairs(markdown_extentions) do
		vim.api.nvim_create_autocmd(
			{ "BufNewFile", "BufRead" },
			{ group = markdown_filetypes, pattern = "*." .. ext, command = "setlocal ft=markdown" }
		)
	end

	local spell_check = vim.api.nvim_create_augroup("SpellCheck", {})
	vim.api.nvim_create_autocmd(
		"FileType",
		{ group = spell_check, pattern = { "rst", "md", "adoc" }, command = "setlocal spell spelllang=en_ca" }
	)
	vim.api.nvim_create_autocmd(
		"BufRead",
		{ group = spell_check, pattern = "COMMIT_EDITMSG", command = "setlocal spell spelllang=en_ca" }
	)

	-- TODO is there a Lua API for those?
	vim.cmd([[
    cnoreabbrev W w
    cnoreabbrev W! w!
    cnoreabbrev Q q
    cnoreabbrev Q! q!
    cnoreabbrev Qa qa
    cnoreabbrev Qa! qa!
    cnoreabbrev Wq wq
    cnoreabbrev Wa wa
    cnoreabbrev WQ wq
    cnoreabbrev Wqa wqa
    iabbrev /t <ESC>oTODO<ESC>VgckJ$a
    iabbrev /r <ESC>oTODO: remove<ESC>VgckJ$a
    ]])
end

vim.g.mapleader = " "
vim.cmd([[colorscheme catppuccin]])

set_mappings()
set_options()
