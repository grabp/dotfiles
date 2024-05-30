local bufferline = require("bufferline")

bufferline.setup({
	highlights = require("catppuccin.groups.integrations.bufferline").get(),
	options = {
		numbers = "ordinal",
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and "" or ""
			return " " .. icon .. count
		end,
		show_tab_indicators = true,
		always_show_bufferline = true,
		tab_size = 18,
		max_name_length = 18,
		max_prefix_length = 15,
	},
})
