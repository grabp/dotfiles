vim.g.mapleader = " "

local wk = require("which-key")

wk.add({
	{ "<leader>p", group = "Explorer" },
	{ "<leader>pv", vim.cmd.Ex, desc = "Open Explorer" },

	{ "<leader>s", group = "Splits" },
	{ "<leader>se", "<C-w>=", desc = "Equalize splits" },
	{ "<leader>sh", "<C-w>v", desc = "Split horizontally" },
	{ "<leader>sv", "<C-w>s", desc = "Split vertically" },
	{ "<leader>sx", "<cmd>close<CR>", desc = "Close the current split" },

	{ "<leader>t", group = "Tabs" },
	{ "<leader>tc", "<cmd>tabclose<CR>", desc = "Close the current tab" },
	{ "<leader>tn", "<cmd>tabnext<CR>", desc = "Go to the next tab" },
	{ "<leader>to", "<cmd>tabnew<CR>", desc = "Open a new tab" },
	{ "<leader>tp", "<cmd>tabprevious<CR>", desc = "Go to the previous tab" },
	{ "<leader>tt", "<cmd>tabnew %<CR>", desc = "Open a new tab with the current file" },
})
