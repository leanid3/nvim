-- Настройка One Dark Pro темы
return {
  "olimorris/onedarkpro.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function(_, opts)
    require('onedarkpro').setup(opts)
    -- Применяем тему с задержкой, чтобы плагин полностью загрузился
    vim.defer_fn(function()
      pcall(vim.cmd.colorscheme, 'onedark')
    end, 100)
  end,
}
