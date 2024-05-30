local nvim_tmux_nav = require('nvim-tmux-navigation')
local wk = require("which-key")

nvim_tmux_nav.setup {
    disable_when_zoomed = true -- defaults to false
}

wk.register({
    ["<C-h>"] = { nvim_tmux_nav.NvimTmuxNavigateLeft, "Navigate left" },
    ["<C-j>"] = { nvim_tmux_nav.NvimTmuxNavigateDown, "Navigate down" },
    ["<C-k>"] = { nvim_tmux_nav.NvimTmuxNavigateUp, "Navigate up" },
    ["<C-l>"] = { nvim_tmux_nav.NvimTmuxNavigateRight, "Navigate right" },
    ["<C-\\>"] = { nvim_tmux_nav.NvimTmuxNavigateLastActive, "Navigate to last active" },
    ["<C-Space>"] = { nvim_tmux_nav.NvimTmuxNavigateNext, "Navigate to next" }
})
