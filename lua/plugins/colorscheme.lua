-- https://github.com/folke/tokyonight.nvim

local M = {
  "folke/tokyonight.nvim",
  -- make sure we load this during startup if it is your main colorscheme
  lazy = false,
  -- make sure to load this before all the other start plugins
  priority = 1000,
  opts = {},
}

function M.config()
  vim.cmd.colorscheme("tokyonight-night")
end

return M
