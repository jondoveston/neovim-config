local M = {
  "hiphish/rainbow-delimiters.nvim",
  event = "VeryLazy",
}

function M.config()
  local rainbow_delimiters = require "rainbow-delimiters"
  vim.g.rainbow_delimiters = {
    strategy = {
      [""] = rainbow_delimiters.strategy["global"],
    },
    query = {
      [""] = "rainbow-delimiters",
    },
  }
end

return M
