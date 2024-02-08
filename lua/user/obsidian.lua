local M = {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false,
  -- ft = "markdown",
  -- event = {
  --   "BufReadPre " .. vim.fn.expand "~" .. "/obsidian/obsidian/**.md",
  --   "BufNewFile " .. vim.fn.expand "~" .. "/obsidian/obsidian/**.md",
  -- },
  dependencies = {
    "hrsh7th/nvim-cmp",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}

M.opts = {
  workspaces = {
    {
      name = "obsidian",
      path = "~/obsidian/obsidian",
    },
  },
  daily_notes = {
    folder = "journal",
    date_format = "%Y-%m-%d",
    template = "Journal.nvim.md",
  },
  templates = {
    subdir = "templates",
    date_format = "%Y-%m-%d",
    time_format = "%H:%M",
    substitutions = {},
  },
  ui = {
    enable = false,
  },
}

return M
