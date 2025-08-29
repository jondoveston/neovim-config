-- https://github.com/obsidian-nvim/obsidian.nvim

local M = {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    "saghen/blink.cmp",
    "folke/snacks.nvim",
    "nvim-treesitter/nvim-treesitter",
  },

  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false,
    disable_frontmatter = true,
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
      substitutions = {
        yesterday = function()
          return os.date("%Y-%m-%d", os.time() - 86400)
        end,
        this_monday = function()
          local today = os.time()
          local current_weekday = tonumber(os.date("%w", today))
          local days_from_monday = (current_weekday == 0) and 6 or (current_weekday - 1)
          local monday = today - (days_from_monday * 24 * 60 * 60)
          return os.date("%Y-%m-%d", monday)
        end,
        week_of_the_year = function()
          return tonumber(os.date "%V")
        end,
      },
    },
    completion = {
      nvim_cmp = false,
      blink = true,
      min_chars = 2,
      create_new = true,
    },
    preferred_link_style = "markdown",
    ui = {
      enable = false,
    },
  },

  keys = {
    {
      "<leader>o",
      function()
        -- use the open daily feature, but open this Mondays note
        local today = os.time()
        local current_weekday = tonumber(os.date("%w", today))
        local days_from_monday = (current_weekday == 0) and 6 or (current_weekday - 1)
        local note = require("obsidian.daily").daily(-days_from_monday, {})
        note:open()
      end,
      desc = "Open this weeks note in Obsidian",
    },
  },
}

return M
