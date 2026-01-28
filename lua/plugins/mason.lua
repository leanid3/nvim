
-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",
        "gopls",                    -- LSP сервер для Go
        "dockerfile-language-server",        -- LSP сервер для Docker (правильное имя для Mason)
        "yaml-language-server",     -- LSP для YAML файлов (включая K8s манифесты) (правильное имя для Mason)
        -- "terraform-ls",             -- LSP для Terraform (временно отключен из-за ошибки установки)
        "bash-language-server",                   -- LSP для Bash скриптов
        "pyright",                  -- LSP для Python

        -- install formatters
        "stylua",
        "gofumpt",                  -- форматтер для Go
        "goimports",                -- импорты для Go
        "prettier",                 -- форматтер для JSON, YAML, JS/TS

        -- install debuggers
        "debugpy",                  -- Python debugger
        "delve",                    -- Go debugger (dlv)

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
