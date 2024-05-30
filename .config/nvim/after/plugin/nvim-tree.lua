local tree = require("nvim-tree")

tree.setup({
    sort = {
        sorter = "case_sensitive"
    },
    view = {
        width = 30,
        side = "left",
    },
    renderer = {
        group_empty = true
    },
    filters = {
        enable = true,
        custom = { ".DS_Store", ".git" },
        git_ignored = true,
    },
    git = {
        ignore = true
    },
    on_attach = on_attach,
    actions = {
        open_file = {
            window_picker = {
                enable = false
            }
        }
    }
})

local wk = require("which-key")

wk.register({
    ["<C-n>"] = { "<cmd>NvimTreeToggle<CR>", "Toggle NvimTree" }
})

