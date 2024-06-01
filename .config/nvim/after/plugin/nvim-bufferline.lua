local bufferline = require("bufferline")

function tablelength(T)
	local count = 0
	for _ in pairs(T) do
		count = count + 1
	end
	return count
end

function truncate_path(path)
	-- change /path/to/file to /p/t/f

	local cwd = vim.fn.getcwd()
	local t = {}
	for str in string.gmatch(path, "([^" .. "/" .. "]+)") do
		if not string.find(cwd, str) then
			table.insert(t, string.sub(str, 1, 1))
		end
	end
	if tablelength(t) == 1 then
		return ""
	end
	table.remove(t, tablelength(t))
	local result = table.concat(t, "/") .. "/"
	return result
end

bufferline.setup({
	highlights = require("catppuccin.groups.integrations.bufferline").get(),
	options = {
		groups = {
			options = {
				toggle_hidden_on_enter = true,
			},
			items = {
				{
					name = "Tests",
					highlight = { underline = true, sp = "blue" },
					priority = 2,
					icon = "",
					matcher = function(buf)
						-- python
						return buf.name:match("test_.*py")
							or buf.path:match("test/.*")
							or buf.path:match("tests/.*")
							or buf.name:match(".*%.spec%.ts")
							or buf.name:match(".*%.test%.ts")
							or buf.name:match(".*%.spec%.js")
							or buf.name:match(".*%.test%.js")
					end,
				},
				{
					name = "Docs",
					highlight = { underline = true, sp = "green" },
					auto_close = false,
					matcher = function(buf)
						return buf.name:match("README%..*")
							or buf.name:match("readme%.*")
							or buf.path:match(".*docs/.*")
					end,
					separator = {
						style = require("bufferline.groups").separator.tab,
					},
				},
			},
		},
		numbers = "ordinal",
		diagnostics = "nvim_lsp",
		name_formatter = function(buf)
			return truncate_path(buf.path) .. buf.name
		end,
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

local wk = require("which-key")

wk.register({
	["<leader>b"] = {
		name = "Bufferline",
		["1"] = { "<cmd>BufferLineGoToBuffer 1<cr>", "Go to buffer 1" },
		["2"] = { "<cmd>BufferLineGoToBuffer 2<cr>", "Go to buffer 2" },
		["3"] = { "<cmd>BufferLineGoToBuffer 3<cr>", "Go to buffer 3" },
		["4"] = { "<cmd>BufferLineGoToBuffer 4<cr>", "Go to buffer 4" },
		["5"] = { "<cmd>BufferLineGoToBuffer 5<cr>", "Go to buffer 5" },
		["6"] = { "<cmd>BufferLineGoToBuffer 6<cr>", "Go to buffer 6" },
		["7"] = { "<cmd>BufferLineGoToBuffer 7<cr>", "Go to buffer 7" },
		["8"] = { "<cmd>BufferLineGoToBuffer 8<cr>", "Go to buffer 8" },
		["9"] = { "<cmd>BufferLineGoToBuffer 9<cr>", "Go to buffer 9" },
	},
})
