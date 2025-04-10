local builtin = require("telescope.builtin")
local telescope = require("telescope")
local wk = require("which-key")

telescope.setup({
	defaults = {
		layout_config = {
			prompt_position = "top",
		},
		layout_strategy = "flex",
		path_display = { "smart" },
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--glob",
			"!{**/.git/*,**/node_modules/*,**/package-lock.json,**/yarn.lock,**/dist/*,**/build/*,**/target/*,**/vendor/*,**/node_modules/*,**/tmp/*,**/cache/*,**/logs/*,**/log/*,**/.nvm/*,**/.turbo/*}",
		},
	},
	extensions = {
		media_files = {
			filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "webm", "pdf", "svg" },
			find_cmd = "rg",
		},
	},
	pickers = {
		find_files = {
			hidden = true,
			file_ignore_patterns = { ".git/*", "node_modules/*", ".DS_Store/*", ".nvm/*", ".turbo/*" },
		},
		live_grep = {
			hidden = true,
			file_ignore_patterns = { ".git/*", "node_modules/*", ".DS_Store/*", ".nvm/*", ".turbo/*" },
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
telescope.load_extension("media_files")

wk.add({
	{ "<C-p>", builtin.git_files, desc = "Git files" },
})

wk.add({
	{ "<leader>f", group = "Find" },
	{ "<leader>fP", builtin.git_status, desc = "Git status" },
	{ "<leader>fS", builtin.lsp_workspace_symbols, desc = "Workspace symbols" },
	{ "<leader>fT", builtin.builtin, desc = "Builtin" },
	{ "<leader>fb", builtin.buffers, desc = "Buffers" },
	{ "<leader>fc", builtin.colorscheme, desc = "Colorscheme" },
	{ "<leader>ff", builtin.find_files, desc = "Find files" },
	{ "<leader>fg", builtin.live_grep, desc = "Grep" },
	{ "<leader>fh", builtin.help_tags, desc = "Help tags" },
	{ "<leader>fp", builtin.git_files, desc = "Git files" },
	{ "<leader>fr", builtin.oldfiles, desc = "Recent files" },
	{ "<leader>fs", builtin.lsp_document_symbols, desc = "Document symbols" },
	{ "<leader>ft", builtin.current_buffer_tags, desc = "Current buffer tags" },
}
)
