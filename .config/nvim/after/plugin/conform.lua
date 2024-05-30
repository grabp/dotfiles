local conform = require("conform")

conform.setup({
	formatters = {
		-- eslint = {
		-- 	rootDir = require("lspconfig.util").find_git_ancestor,
		-- },
	},
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black", "isort", "autoflake" },
		javascript = { "eslint_d", "prettierd" },
		typescript = { "eslint_d", "prettierd" },
		typescriptreact = { "eslint_d", "prettierd" },
		javascriptreact = { "eslint_d", "prettierd" },
		astro = { "eslint_d" },
		json = { "prettierd" },
		yaml = { "prettierd" },
		html = { "prettierd" },
		css = { "prettierd" },
		scss = { "prettierd" },
		sass = { "prettierd" },
		less = { "prettierd" },
		graphql = { "prettierd" },
		vue = { "prettierd" },
		svelte = { "prettierd" },
		rust = { "rustfmt" },
		sh = { "shfmt" },
		dockerfile = { "dockerfilelint" },
		sql = { "sqlformat" },
		swift = { "swiftformat" },
		elixir = { "mix format" },
		markdown = { "prettierd" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 1000,
		lsp_fallback = true,
	},
})
