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

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

-- wk.register({
--     ["<leader>a"] = { , "Add file to harpoon" },
--     ["<C-e>"] = { , "Open harpoon window" },
--     ["<C-S-P>"] = { , "Navigate to previous harpoon buffer" },
--     ["<C-S-N>"] = { , "Navigate to next harpoon buffer" },
-- })

wk.add({
	{
		"<leader>l",
		group = "Harpoon",
	},
	{
		"<leader>ln",
		function()
			harpoon:list():next()
		end,
		desc = "Navigate to next harpoon buffer",
	},
	{
		"<leader>lp",
		function()
			harpoon:list():prev()
		end,
		desc = "Navigate to previous harpoon buffer",
	},
	{
		"<leader>le",
		function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end,
		desc = "Open harpoon window",
	},
	{
		"<leader>la",
		function()
			harpoon:list():add()
		end,
		desc = "Add file to harpoon",
	},
})
