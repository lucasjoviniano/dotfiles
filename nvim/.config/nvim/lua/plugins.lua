local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	autoremove = true,
})

packer.startup(function(use)
	-- Core
	use("wbthomason/packer.nvim") -- Have packer manage itself

	use({
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient").enable_profile()
		end,
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("config.telescope")
		end,
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("config.treesitter")
		end,
		requires = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-context",
		},
	})

	-- LSP
	use({
		"williamboman/mason.nvim",
		requires = {
			-- lsp
			"williamboman/mason-lspconfig.nvim",
			"onsails/lspkind-nvim",
			"neovim/nvim-lspconfig",
			"jose-elias-alvarez/null-ls.nvim",
			"onsails/lspkind-nvim",
			"simrat39/symbols-outline.nvim",

			-- cmp
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-calc",

			-- cmp x lsp
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",

			-- snip x cmp
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",

			-- autopairs (x cmp)
			"windwp/nvim-autopairs",
		},
		config = function()
			require("lspkind").init()
			require("luasnip").setup({
				-- see: https://github.com/L3MON4D3/LuaSnip/issues/525
				region_check_events = "InsertEnter",
				delete_check_events = "InsertLeave",
			})
			require("luasnip.loaders.from_vscode").lazy_load()
			require("nvim-autopairs").setup()
			require("config.lsp")
			require("config.symbols-outline")
			require("config.cmp")
		end,
	})

	use({
		"mfussenegger/nvim-dap",
		config = function()
			require("config.debug")
		end,
		requires = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
		},
	})

	-- UI
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("config.colorscheme")
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		after = "catppuccin",
		config = function()
			require("config.lualine")
		end,
	})

	use({
		"folke/noice.nvim",
		event = "VimEnter",
		config = function()
			require("noice").setup()
		end,
		requires = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	})

	use({
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({
				default = true,
			})
		end,
	})

	use({
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup({})
		end,
	})

	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({
				text = {
					spinner = "dots",
				},
				window = {
					blend = 0,
				},
			})
		end,
	})

	-- Util
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({})
		end,
	})

	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
	})

	use({
		"folke/trouble.nvim",
		config = function()
			require("config.trouble")
		end,
	})
end)

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source <afile> | PackerSync",
	group = vim.api.nvim_create_augroup("Packer", { clear = true }),
	pattern = "plugins.lua",
})
