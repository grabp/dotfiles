local lsp_zero = require("lsp-zero")

lsp_zero.preset("recommended")

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr, remap = false })
end)

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
		"jedi_language_server",
		"sqlls",
		"tailwindcss",
		"yamlls",
		"lua_ls",
	},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	},
})
require("mason-tool-installer").setup({
	ensure_installed = {
		"prettier",
		"eslint",
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
	},
})

lsp_zero.setup()

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
