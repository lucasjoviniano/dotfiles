-- bootstrap Packer
local packer_path = "/site/pack/packer/start/packer.nvim"
local install_path = vim.fn.stdpath("data") .. packer_path
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	local repo = "https://github.com/wbthomason/packer.nvim"
	local clone = { "git", "clone", "--depth", "1", repo, install_path }
	PackerBboostraped = vim.fn.system(clone)
end

vim.cmd([[packadd packer.nvim]])

if PackerBboostraped then
	require("packer").sync()
end

local packer_user_config = vim.api.nvim_create_augroup("PackerUserConfig", {})
vim.api.nvim_create_autocmd(
	"BufWritePost",
	{ group = packer_user_config, pattern = "plugins.lua", command = "source <afile> | PackerCompile" }
)

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"sbdchd/neoformat",
	})

	use({
		"TimUntersberger/neogit",
		config = function()
			require("config.neogit")
		end,
	})

	use("nvim-lua/plenary.nvim")

	use("nvim-lua/popup.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
		config = function()
			require("config.telescope")
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
		"neovim/nvim-lspconfig",
		config = function()
			require("config.lsp_config")
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
		},
		config = function()
			require("config.cmp")
		end,
	})

	use("onsails/lspkind-nvim")

	use("nvim-lua/lsp_extensions.nvim")

	use("glepnir/lspsaga.nvim")

	use("simrat39/symbols-outline.nvim")

	use({
		"L3MON4D3/LuaSnip",
		config = function()
			require("config.luasnips")
		end,
	})

	use("saadparwaiz1/cmp_luasnip")

	use({
		"gelguy/wilder.nvim",
		run = ":UpdateRemotePlugins",
		config = function()
			require("config.wilder")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("config.treesitter")
		end,
	})

	use("nvim-treesitter/playground")
	use({
		"romgrk/nvim-treesitter-context",
		config = function()
			require("config.treesitter-context")
		end,
	})

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("config.trouble")
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
		"Maan2003/lsp_lines.nvim",
		config = function()
			require("config.lsp_lines")
		end,
	})

	use({
		"RRethy/vim-illuminate",
		config = function()
			require("config.illuminate")
		end,
	})

	use({
		"Darazaki/indent-o-matic",
		config = function()
			require("indent-o-matic").setup({
				-- Number of lines without indentation before giving up (use -1 for infinite)
				max_lines = 2048,
				-- Space indentations that should be detected
				standard_widths = { 2, 3, 4, 8 },
			})
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

	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("config.catpuccin")
		end,
	})

	use("wakatime/vim-wakatime")
end)
