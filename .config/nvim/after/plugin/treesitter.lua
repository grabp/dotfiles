require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "css", "diff", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "python", "astro" },

	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,

		additional_vim_regex_highlighting = false,
	},
})
