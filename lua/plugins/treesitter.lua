-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "go",           -- Поддержка Go
      "gomod",        -- Поддержка go.mod файлов
      "gosum",        -- Поддержка go.sum файлов
      "gowork",       -- Поддержка go.work файлов
      "yaml",         -- Поддержка YAML (для Docker, K8s, CI/CD)
      "dockerfile",   -- Поддержка Dockerfile
      "hcl",          -- Поддержка HCL (для Terraform)
      "bash",         -- Поддержка Bash скриптов
      "python",       -- Поддержка Python
      "json",         -- Поддержка JSON
      "toml",         -- Поддержка TOML
      "markdown",     -- Поддержка Markdown
      "markdown_inline", -- Поддержка встроенного Markdown
      -- add more arguments for adding more treesitter parsers
    },
    -- Дополнительные настройки для Treesitter
    highlight = {
      enable = true,
      -- Указать язык, для которого не включать highlight
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100kb
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },
    indent = { enable = true },
  },
}