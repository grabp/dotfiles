local catppuccin = require("catppuccin")

catppuccin.setup({
	flavour = "mocha",
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
		bufferline = true,
		indent_blankline = {
			enabled = true,
			scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
			colored_indent_levels = false,
		},
	},
})

vim.cmd("colorscheme catppuccin")
