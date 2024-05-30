local catppuccin = require("catppuccin")

catppuccin.setup({
	flavour = "mocha",
	term_colors = true,
	transparent_background = true,
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = false,
		gitgutter = true,
		lsp_trouble = true,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
		indent_blankline = {
			enabled = true,
			scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
			colored_indent_levels = false,
		},
	},
})

vim.cmd.colorscheme("catppuccin")
