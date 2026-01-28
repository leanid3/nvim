-- Плагины для DevOps разработчика
return {
  -- Поддержка Docker файлов
  {
    "cameron-wags/rainbow_csv.nvim",
    ft = { "csv", "tsv", "log" },
    cmd = { "RainbowDelim", "RainbowLoadDelim", "RainbowClear" },
  },

  -- Поддержка Kubernetes манифестов
  {
    "jvirtanen/vim-hcl",
    ft = { "hcl" }
  },

  -- Поддержка Terraform
  {
    "hashivim/vim-terraform",
    ft = { "terraform", "tf" },
    cmd = {
      "Terraform",
      "TerraformFmt",
      "TerraformValidate",
      "TerraformFmt",
    },
    init = function()
      vim.g.terraform_fmt_on_save = 1
      vim.g.terraform_align = 1
    end,
  },

  -- Подсветка TODO комментариев
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = "nvim-lua/plenary.nvim",
    opts = { signs = true },
  },

  -- Просмотр структуры кода
  {
    "stevearc/aerial.nvim",
    event = "VeryLazy",
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>cs", "<cmd>AerialToggle<cr>", desc = "Aerial" },
    },
  },
}