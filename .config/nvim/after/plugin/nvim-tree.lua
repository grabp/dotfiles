local neotree = require("neo-tree")
local highlights = require("neo-tree.ui.highlights")

neotree.setup({
	sources = {
		"filesystem",
		"buffers",
		"git_status",
		"document_symbols",
	},
	enable_git_status = true,
	window = {
		position = "right",
		width = 50,
	},
	source_selector = {
		winbar = true,
		statusline = true,
		sources = {
			{ source = "filesystem" },
			{ source = "buffers" },
			{ source = "git_status" },
			{ source = "document_symbols" },
		},
		content_layout = "center",
		tabs_layout = "active",
	},
	document_symbols = {
		follow_cursor = true,
	},
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_hidden = false,
		},
		hide_by_name = {
			"node_modules",
			".git",
		},
		follow_current_file = {
			width = 30,
			enabled = true,
		},
		group_empty_dirs = true,
		components = {
			icon = function(config, node, state)
				local icon = config.default or " "
				local padding = config.padding or " "
				local highlight = config.highlight or highlights.FILE_ICON

				if node.type == "directory" then
					highlight = highlights.DIRECTORY_ICON
					if node:is_expanded() then
						icon = config.folder_open or "-"
					else
						icon = config.folder_closed or "+"
					end
				elseif node.type == "file" then
					local success, web_devicons = pcall(require, "nvim-web-devicons")
					if success then
						local devicon, hl = web_devicons.get_icon(node.name, node.ext)
						icon = devicon or icon
						highlight = hl or highlight
					end
				end

				return {
					text = icon .. padding,
					highlight = highlight,
				}
			end,
			harpoon_index = function(config, node, _)
				local harpoon_list = require("harpoon"):list()
				local path = node:get_id()
				local harpoon_key = vim.uv.cwd()

				for i, item in ipairs(harpoon_list.items) do
					local value = item.value
					if string.sub(item.value, 1, 1) ~= "/" then
						value = harpoon_key .. "/" .. item.value
					end

					if value == path then
						return {
							text = string.format(" ⥤ %d", i), -- <-- Add your favorite harpoon like arrow here
							highlight = config.highlight or "NeoTreeDirectoryIcon",
						}
					end
				end
				return {}
			end,
		},
		renderers = {
			file = {
				{ "icon" },
				{ "name", use_git_status_colors = true },
				{ "harpoon_index" }, --> This is what actually adds the component in where you want it
				{ "diagnostics" },
				{ "git_status", highlight = "NeoTreeDimText" },
			},
		},
	},
})

local wk = require("which-key")

wk.register({
	["<C-n>"] = { "<cmd>Neotree<CR>", "Toggle NeoTree" },
})
