local nvim_tmux_nav = require("nvim-tmux-navigation")
local wk = require("which-key")

nvim_tmux_nav.setup({
	disable_when_zoomed = true, -- defaults to false
})

wk.add({
	{ "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext, desc = "Navigate to next" },
	{ "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive, desc = "Navigate to last active" },
	{ "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft, desc = "Navigate left" },
	{ "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown, desc = "Navigate down" },
	{ "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp, desc = "Navigate up" },
	{ "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight, desc = "Navigate right" },
})
