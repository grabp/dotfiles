local wk = require("which-key")
local neovim_project = require("neovim-project")

vim.opt.sessionoptions:append("globals")

neovim_project.setup({
	projects = {
		"~/Projects/*",
		"~/dotfiles",
	},
})

wk.add({
	{ "<leader>k", group = "Project" },
	{ "<leader>kd", "<cmd>:Telescope neovim-project discover<CR>", desc = "Discover" },
	{ "<leader>kh", "<cmd>:Telescope neovim-project history<CR>", desc = "History" },
	{ "<leader>kr", "<cmd>:Telescope neovim-project recent<CR>", desc = "Recent" },
})
