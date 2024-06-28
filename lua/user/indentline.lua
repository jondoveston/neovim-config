-- https://github.com/lukas-reineke/indent-blankline.nvim
local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  main = "ibl",
  opts = {},
}

function M.config()
  local icons = require "user.icons"

  require("ibl").setup {
    indent = { char = icons.ui.LineMiddle },
    whitespace = {
      remove_blankline_trail = true,
    },

    exclude = {
      filetypes = {
        "help",
        "startify",
        "dashboard",
        "lazy",
        "neogitstatus",
        "NvimTree",
        "Trouble",
        "text",
      },
      buftypes = { "terminal", "nofile" },
    },
    scope = { enabled = false },
  }
end

return M
