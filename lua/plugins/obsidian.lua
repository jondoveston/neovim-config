-- https://github.com/epwalsh/obsidian.nvim
local M = {
  "jondoveston/obsidian.nvim",
  branch = "add-weekly-notes",
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
  keys = {
    {
      "<leader>j",
      "<cmd>ObsidianThisWeek<cr>",
      desc = "Open this weeks note in Obsidian",
    },
  },
}

M.opts = {
  workspaces = {
    {
      name = "obsidian",
      path = "~/obsidian",
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
