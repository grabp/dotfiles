local lint = require("lint")
local wk = require("which-key")

-- lint.linters_by_ft = {
-- 	python = { "flake8" },
-- 	javascript = { "eslint" },
-- 	typescript = { "eslint" },
-- 	astro = { "eslint" },
-- 	json = { "jsonlint" },
-- 	yaml = { "yamllint" },
-- 	html = { "htmlhint" },
-- 	css = { "stylelint" },
-- 	scss = { "stylelint" },
-- 	sass = { "stylelint" },
-- 	less = { "stylelint" },
-- 	graphql = { "graphql" },
-- 	vue = { "eslint" },
-- 	svelte = { "eslint" },
-- 	rust = { "cargo" },
-- 	sh = { "shellcheck" },
-- 	dockerfile = { "hadolint" },
-- 	sql = { "sqlfluff" },
-- 	swift = { "swiftlint" },
-- 	elixir = { "mix" },
-- 	markdown = { "markdownlint" },
-- }

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})

wk.register({
	["<leader>"] = {
		name = "Lint",
		l = {
			function()
				lint.try_lint()
			end,
			"Lint",
		},
	},
})
