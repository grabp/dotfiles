
local bufferline = require('bufferline')
local mocha = require("catppuccin.palettes").get_palette "mocha"

bufferline.setup({
    highlights = require("catppuccin.groups.integrations.bufferline").get(),
    options = {
        -- mode = "tabs",
        numbers = "ordinal",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and "" or ""
            return " " .. icon .. count
        end,
        show_tab_indicators = true,
        separator_style = "slant",
        always_show_bufferline = true,
        tab_size = 18,
        max_name_length = 18,
        max_prefix_length = 15,
        max_prefix_length = 15,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "left"
            }
        }
    }
})
