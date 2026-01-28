-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
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
      "yamlls", -- LSP для YAML файлов (включая K8s манифесты)
      -- "terraform-ls",  -- LSP для Terraform (временно отключен из-за ошибки установки)
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
            -- Убираем неподдерживаемую настройку formatter
          }
        }
      },
      ["yamlls"] = {
        settings = {
          yaml = {
            schemas = {
              kubernetes = "/*.yaml", -- Применяем схему Kubernetes ко всем yaml файлам
            }
          }
        }
      }
    },
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- customize how language servers are attached
    handlers = {
      gopls = function (_, opts)
        -- Настройка gopls с использованием gofumpt и goimports
        opts.settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            -- Указываем gofumpt как formatter
            gofumpt = true,
          }
        }
        require("lspconfig").gopls.setup(opts)
      end
    },
  },
}