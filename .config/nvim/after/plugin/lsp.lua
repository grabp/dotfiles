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

wk.register({
	["g"] = {
		name = "Go to",
		d = {
			function()
				vim.lsp.buf.definition()
			end,
			"Go to definition",
		},
		D = {
			function()
				vim.lsp.buf.declaration()
			end,
			"Go to declaration",
		},
		i = {
			function()
				vim.lsp.buf.implementation()
			end,
			"Go to implementation",
		},
		r = {
			function()
				vim.lsp.buf.references()
			end,
			"Go to references",
		},
		t = {
			function()
				vim.lsp.buf.type_definition()
			end,
			"Go to type definition",
		},
	},
	["h"] = {
		name = "Hover",
		h = {
			function()
				vim.lsp.buf.hover()
			end,
			"Show hover",
		},
		s = {
			function()
				vim.lsp.buf.signature_help()
			end,
			"Show signature help",
		},
	},
	["a"] = {
		name = "Actions",
		a = {
			function()
				vim.lsp.buf.code_action()
			end,
			"Code action",
		},
		r = {
			function()
				vim.lsp.buf.rename()
			end,
			"Rename",
		},
		s = {
			function()
				vim.lsp.buf.workspace_symbol()
			end,
			"Workspace symbol",
		},
	},
	["l"] = {
		name = "LSP Server",
		r = {
			function()
				vim.lsp.stop_client(vim.lsp.get_active_clients())
			end,
			"Restart LSP server",
		},
	},
})
