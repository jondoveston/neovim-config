-- https://github.com/andrewferrier/wrapping.nvim
local M = {
  "andrewferrier/wrapping.nvim",
  event = { "BufWinEnter" },
}

function M.config()
  require("wrapping").setup {}
end

return M
