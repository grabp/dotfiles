local harpoon = require("harpoon")
local wk = require("which-key")

-- REQUIRED
harpoon:setup()

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end


wk.register({
    ["<leader>a"] = { function() harpoon:list():add() end, "Add file to harpoon" },
    ["<C-e>"] = { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Open harpoon window" },
    ["<C-S-P>"] = { function() harpoon:list():prev() end, "Navigate to previous harpoon buffer" },
    ["<C-S-N>"] = { function() harpoon:list():next() end, "Navigate to next harpoon buffer" },
})
