-- Плагин One Dark Pro theme
return {
  "olimorris/onedarkpro.nvim",
  lazy = false,
  priority = 1000, -- высокий приоритет для загрузки темы
  opts = {
    -- Настройка различных вариантов темы One Dark Pro
    colors = {}, -- Override default colors
    highlights = {}, -- Override default highlights
    styles = { -- Style to be applied to different syntax groups
      comments = "italic", -- Value is any valid attr-list value for `:help nvim_set_hl`
      keywords = "italic,bold",
      functions = "bold",
      strings = "italic",
      variables = "NONE",
    },
    options = {
      bold_vert_split = false, -- Use bold vertical separators
      cursorline_opacity = 0.15, -- Cursorline opacity. Values between 0 and 1
      highlight_cursorword = true, -- Highlight the current word under the cursor
      highlight_url = true, -- Highlight URLs
      transparent = false, -- Show the window background color
      terminal_colors = true, -- Use the theme's colors for the terminal
    }
  },
}