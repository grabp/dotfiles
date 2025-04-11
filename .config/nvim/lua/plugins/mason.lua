return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        -- Python
        "bandit",
        "ruff",
        "pyright",
        "isort",
        "pyproject-fmt",
        -- TypeScript
        "biome",
        "typescript-language-server",
        "vtsls",
        -- Bash
        "bash-language-server",
        -- CSS
        "css-lsp",
        "stylelint",
        -- Docker
        "dockerfile-language-server",
        "docker-compose-language-service",
        -- Astro
        "astro-language-server",
        -- YAML
        "yaml-language-server",
        "yamlfix",
        -- JSON
        "json-lsp",
        -- Grammar
        "harper-ls",
        -- TOML
        "taplo",
      },
    },
  },
}
