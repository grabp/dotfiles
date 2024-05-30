local lualine = require("lualine")

lualine.setup({
	options = { theme = "catppuccin-mocha" },
	sections = {
		-- lualine_c = { require("auto-session.lib").current_session_name },
		lualine_x = {
			{ "encoding" },
			{ "fileformat" },
			{ "filetype" },
			{ "swenv", icon = "🐍" },
		},
	},
})
