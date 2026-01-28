-- Настройка LSP серверов для DevOps разработки
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      codelens = true, -- enable/disable codelens refresh on start
      inlay_hints = false, -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
    },
    -- enable servers that you already have installed without mason
    servers = {
      "gopls",         -- LSP сервер для Go
      "dockerls",      -- LSP сервер для Docker
      -- "docker-compose-language-service", -- LSP для Docker Compose (сервер недоступен)
      "yamlls", -- LSP для YAML файлов (включая K8s манифесты)
      -- "terraform-ls",  -- LSP для Terraform (сервер недоступен)
      "bashls",        -- LSP для Bash скриптов
      "pyright",       -- LSP для Python
    },
    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      gopls = {
        -- Настройки для Go LSP сервера
        settings = {
          gopls = {
            -- Включаем автодополнение
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            -- Указываем, что использовать для форматирования
            formatter = "gofumpt",
          }
        }
      },
      ["yaml-language-server"] = {
        settings = {
          yaml = {
            schemas = {
              kubernetes = "/*.yaml", -- Применяем схему Kubernetes ко всем yaml файлам
            }
          }
        }
      }
    },
  },
}