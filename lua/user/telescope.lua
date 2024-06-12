local M = {
  "nvim-telescope/telescope.nvim",
  event = "Bufenter",
  cmd = { "Telescope" },
  dependencies = {
    {
      "ahmedkhalf/project.nvim",
    },
    {
      "folke/trouble.nvim",
    },
  },
}

local actions = require "telescope.actions"
local open_with_trouble = require("trouble.sources.telescope").open

M.opts = {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "absolute" },
    file_ignore_patterns = { ".git/", "node_modules" },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob",
      "!.git/*",
    },
    mappings = {
      i = {
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<c-t>"] = open_with_trouble,
      },
      n = {
        ["<c-t>"] = open_with_trouble,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    buffers = {
      mappings = {
        i = {
          ["<C-q>"] = actions.delete_buffer
        }
      }
    }
  }
}

return M
