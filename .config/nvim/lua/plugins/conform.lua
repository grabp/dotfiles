return {
  {
    "stevearc/conform.nvim",
    opts = {
      lua = { "stylua" },
      python = { "ruff", "isort" },
      javascript = { "biome", "biome-organize-imports" },
      json = { "biome" },
    },
  },
}
