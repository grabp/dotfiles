local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black", "isort", "autoflake" },
		javascript = { "eslint", "prettier" },
		typescript = { "eslint", "prettier" },
		astro = { "eslint", "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
		sass = { "prettier" },
		less = { "prettier" },
		graphql = { "prettier" },
		vue = { "prettier" },
		svelte = { "prettier" },
		rust = { "rustfmt" },
		sh = { "shfmt" },
		dockerfile = { "dockerfilelint" },
		sql = { "sqlformat" },
		swift = { "swiftformat" },
		elixir = { "mix format" },
		markdown = { "prettier" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
