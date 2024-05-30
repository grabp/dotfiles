local wk = require("which-key")

wk.register({
	["n"] = {
		name = "Nvm",
		l = { "<cmd>NvmList<CR>", "List" },
	},
}, { prefix = "<leader>" })
