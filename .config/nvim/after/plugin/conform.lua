local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black", "isort", "autoflake" },
		javascript = { "eslint_d", "prettierd" },
		typescript = { "eslint_d", "prettierd" },
		typescriptreact = { "eslint_d", "prettierd" },
		javascriptreact = { "eslint_d", "prettierd" },
		astro = { "eslint_d" },
		dockerfile = { "dockerfilelint" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 1000,
		lsp_fallback = true,
	},
})
