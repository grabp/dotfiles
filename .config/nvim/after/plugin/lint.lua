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
