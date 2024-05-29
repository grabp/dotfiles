local tree = require("nvim-tree")


tree.setup({
    sort = {
        sorter = "case_sensitive"
    },
    view = {
        width = 30
    },
    renderer = {
        group_empty = true
    },
    filters = {
        dotfiles = false
    },
})

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
