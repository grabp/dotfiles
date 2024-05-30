local cmp = require("cmp")
local tailwindcss_colorizer_cmp = require("tailwindcss-colorizer-cmp")

cmp.config.formatting = {
	format = tailwindcss_colorizer_cmp.formatter,
}
