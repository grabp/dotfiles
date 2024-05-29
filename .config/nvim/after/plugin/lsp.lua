local lsp_zero = require('lsp-zero')

lsp_zero.preset("recommended")

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr, remap = false})

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_sumbol() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_actions() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'astro', 'bashls', 'cssls', 'dockerls', 'docker_compose_language_service', 'eslint', 'tsserver', 'markdown_oxide', 'jedi_language_server', 'sqlls', 'tailwindcss', 'yamlls'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

lsp_zero.setup()

