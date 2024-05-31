local wk = require("which-key")
local neovim_project = require("neovim-project")

vim.opt.sessionoptions:append("globals")

neovim_project.setup({
	projects = {
		"~/Projects/*",
		"~/dotfiles",
	},
})
wk.register({
	k = {
		name = "Project",
		d = { "<cmd>:Telescope neovim-project discover<CR>", "Discover" },
		r = { "<cmd>:Telescope neovim-project recent<CR>", "Recent" },
		h = { "<cmd>:Telescope neovim-project history<CR>", "History" },
	},
}, { prefix = "<leader>" })
