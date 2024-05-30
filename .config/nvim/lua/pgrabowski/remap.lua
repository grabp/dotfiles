
vim.g.mapleader = " "

local wk = require("which-key")

wk.register({
    p = {
        name = "Explorer",
        v = { vim.cmd.Ex, "Open Explorer" }
    },
    s = {
        name = "Splits",
        v = { "<C-w>s", "Split vertically" },
        h = { "<C-w>v", "Split horizontally" },
        e = { "<C-w>=", "Equalize splits" },
        x = { "<cmd>close<CR>", "Close the current split" }
    },
    t = {
        name = "Tabs",
        o = { "<cmd>tabnew<CR>", "Open a new tab" },
        c = { "<cmd>tabclose<CR>", "Close the current tab" },
        n = { "<cmd>tabnext<CR>", "Go to the next tab" },
        p = { "<cmd>tabprevious<CR>", "Go to the previous tab" },
        t = { "<cmd>tabnew %<CR>", "Open a new tab with the current file" }
    }
}, { prefix = "<leader>" })

