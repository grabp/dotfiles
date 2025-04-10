local comment = require("Comment")
local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

comment.setup({
	padding = true,
	ignore = "^$",
	mappings = {
		basic = true,
		extra = true,
		extended = true,
	},
	toggler = {
		line = "gcc",
		block = "gbc",
	},
	opleader = {
		line = "gcl",
		block = "gbb",
	},
	pre_hook = ts_context_commentstring.create_pre_hook(),
})
