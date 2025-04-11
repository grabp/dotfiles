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
        -- TypeScript
        "biome",
        "typescript-language-server",
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
      },
    },
  },
}
