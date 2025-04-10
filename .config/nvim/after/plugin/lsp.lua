local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")

lsp_zero.preset("recommended")

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr, remap = false })
end)

function eslint_custom()
	lspconfig.eslint.setup({
		root_dir = require("lspconfig.util").find_git_ancestor,
		settings = {
			workingDirectory = {
				mode = "location",
			},
			experimental = {
				useFlatConfig = true,
			},
		},
	})
end

function handler(server_name)
	if server_name == "eslint" then
		eslint_custom()
	else
		lspconfig[server_name].setup({})
	end
end

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"astro",
		"bashls",
		"cssls",
		"dockerls",
		"docker_compose_language_service",
		"eslint",
		"tsserver",
		"markdown_oxide",
		"pyright",
		"sqlls",
		"tailwindcss",
		"yamlls",
		"lua_ls",
		"hydra_lsp",
		"taplo",
		"jsonls",
		"graphql",
		"bashls",
		"spectral",
		"prismals",
		"terraformls",
		"ruff",
	},
	handlers = { handler },
})
require("mason-tool-installer").setup({
	ensure_installed = {
		"prettierd",
		"isort",
		"black",
		"pylint",
		"flake8",
		"stylua",
		"rustfmt",
		"sqlfluff",
		"shfmt",
		"hadolint",
		"htmlhint",
		"autoflake",
		"eslint_d",
	},
})

lsp_zero.setup()
-- lsp_configurations.eslint.default_config.root_dir = require("lspconfig.util").root_pattern("tsconfig.json")

local wk = require("which-key")

wk.add({
	{ "a", group = "Actions" },
	{
		"aa",
		function()
			vim.lsp.buf.code_action()
		end,
		desc = "Code action",
	},
	{
		"ar",
		function()
			vim.lsp.buf.rename()
		end,
		desc = "Rename",
	},
	{
		"as",
		function()
			vim.lsp.buf.workspace_symbol()
		end,
		desc = "Workspace symbol",
	},
	{ "g", group = "Go to" },
	{
		"gD",
		function()
			vim.lsp.buf.declaration()
		end,
		desc = "Go to declaration",
	},
	{
		"gd",
		function()
			vim.lsp.buf.definition()
		end,
		desc = "Go to definition",
	},
	{
		"gi",
		function()
			vim.lsp.buf.implementation()
		end,
		desc = "Go to implementation",
	},
	{
		"gr",
		function()
			vim.lsp.buf.references()
		end,
		desc = "Go to references",
	},
	{
		"gt",
		function()
			vim.lsp.buf.type_definition()
		end,
		desc = "Go to type definition",
	},
	{ "h", group = "Hover" },
	{
		"hh",
		function()
			vim.lsp.buf.hover()
		end,
		desc = "Show hover",
	},
	{
		"hs",
		function()
			vim.lsp.buf.signature_help()
		end,
		desc = "Show signature help",
	},
	{ "l", group = "LSP Server" },
	{
		"lr",
		function()
			vim.lsp.stop_client(vim.lsp.get_active_clients())
		end,
		desc = "Restart LSP server",
	},
})
