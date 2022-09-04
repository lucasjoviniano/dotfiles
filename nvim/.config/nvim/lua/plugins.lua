vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
		config = function()
			require("config.telescope")
		end,
	})

	use({
		"rcarriga/nvim-notify",
		config = function()
			require("config.notify")
		end,
	})

	use({
		"gelguy/wilder.nvim",
		run = ":UpdateRemotePlugins",
		config = function()
			require("config.wilder")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = "TSUpdate",
		config = function()
			require("config.treesitter")
		end,
	})

	use({
		"williamboman/mason.nvim",
		requires = { "neovim/nvim-lspconfig", "williamboman/mason-lspconfig.nvim" },
		config = function()
			require("config.mason")
		end,
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"f3fora/cmp-spell",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"quangnguyen30192/cmp-nvim-tags",
			"ray-x/cmp-treesitter",
			"lukas-reineke/cmp-rg",
			"petertriho/cmp-git",
		},
		config = function()
			require("config.cmp")
		end,
	})

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("config.trouble")
		end,
	})

	use({ "RRethy/nvim-treesitter-endwise", ft = { "lua", "ruby", "elixir" } })

	use({
		"b3nj5m1n/kommentary",
		config = function()
			require("config.kommentary")
		end,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("config.tree")
		end,
	})

	use({
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("config.lualine")
		end,
	})

	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("config.null_ls")
		end,
	})

	use({
		"Maan2003/lsp_lines.nvim",
		config = function()
			require("config.lsp_lines")
		end,
	})

	use({ "markonm/traces.vim" })
	use({
		"winston0410/range-highlight.nvim",
		requires = { "winston0410/cmd-parser.nvim" },
		config = function()
			require("config.traces")
		end,
	})

	use("ayu-theme/ayu-vim")

	use("wakatime/vim-wakatime")
end)
