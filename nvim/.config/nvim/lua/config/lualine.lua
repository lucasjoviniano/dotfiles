local c = require("gruvbox-baby.colors").config()

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = {
			normal = {
				a = { bg = c.light_blue, fg = c.dark, gui = "bold" },
				b = { bg = c.background, fg = c.light_blue },
				c = { bg = c.background, fg = c.milk },
			},
			insert = {
				a = { bg = c.bright_yellow, fg = c.dark, gui = "bold" },
				b = { bg = c.background, fg = c.bright_yellow },
				c = { bg = c.background, fg = c.milk },
			},
			visual = {
				a = { bg = c.milk, fg = c.dark, gui = "bold" },
				b = { bg = c.background, fg = c.milk },
				c = { bg = c.background, fg = c.milk },
			},
			replace = {
				a = { bg = c.error_red, fg = c.dark, gui = "bold" },
				b = { bg = c.background, fg = c.error_red },
				c = { bg = c.background, fg = c.milk },
			},
			command = {
				a = { bg = c.soft_green, fg = c.dark, gui = "bold" },
				b = { bg = c.background, fg = c.soft_green },
				c = { bg = c.background, fg = c.milk },
			},
			inactive = {
				a = { bg = c.background, fg = c.light_blue, gui = "bold" },
				b = { bg = c.background, fg = c.gray },
				c = { bg = c.background, fg = c.gray },
			},
		},
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = false,
		path = 1,
		buffers_color = {
			-- Same values as the general color option can be used here.
			active = "lualine_{section}_normal", -- Color for active buffer.
			inactive = "lualine_{section}_normal", -- Color for inactive buffer.
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = { "LspStatus()", "location" },
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = { "location" },
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
