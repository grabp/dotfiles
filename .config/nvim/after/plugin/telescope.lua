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

wk.register({
	["<C-p>"] = { builtin.git_files, "Git files" },
})

wk.register({
	f = {
		name = "Find",
		f = { builtin.find_files, "Find files" },
		g = { builtin.live_grep, "Grep" },
		b = { builtin.buffers, "Buffers" },
		h = { builtin.help_tags, "Help tags" },
		r = { builtin.oldfiles, "Recent files" },
		s = { builtin.lsp_document_symbols, "Document symbols" },
		S = { builtin.lsp_workspace_symbols, "Workspace symbols" },
		c = { builtin.colorscheme, "Colorscheme" },
		p = { builtin.git_files, "Git files" },
		P = { builtin.git_status, "Git status" },
		t = { builtin.current_buffer_tags, "Current buffer tags" },
		T = { builtin.builtin, "Builtin" },
	},
}, { prefix = "<leader>" })
