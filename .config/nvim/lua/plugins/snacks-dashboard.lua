return {
  {
    "snacks.nvim",
    opts = {
      dashboard = {
        sections = {
          {
            section = "terminal",
            cmd = "chafa ~/.config/nvim/dashboard.png --format symbols --symbols vhalf --size 40 --stretch; sleep .1",
            height = 20,
            padding = 1,
            indent = 10,
          },

          { section = "header", pane = 1 },

          { icon = " ", title = "Recent Files", section = "recent_files", padding = 1 },
          { icon = " ", title = "Projects", section = "projects", padding = 1 },
          {
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
          },

          { section = "keys", gap = 1, padding = 1 },

          { section = "startup" },
        },
        preset = {
          --          pick = function(cmd, opts)
          --            return LazyVim.pick(cmd, opts)()
          --          end,
          --          header = [[
          --        ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
          --        ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
          --        ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
          --        ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
          --        ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
          --        ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
          -- ]],
          --          -- stylua: ignore
          --          ---@type snacks.dashboard.Item[]
          --          keys = {
          --            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          --            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          --            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          --            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          --            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          --            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          --            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          --            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          --            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          --          },
        },
      },
    },
  },
}
