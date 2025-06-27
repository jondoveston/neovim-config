-- https://github.com/andrewferrier/wrapping.nvim
local M = {
  "andrewferrier/wrapping.nvim",
  event = { "BufWinEnter" },
}

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>wt", "<cmd>ToggleWrapMode<cr>", desc = "Toggle wrap mode" },
    { "<leader>wp", "gwip", desc = "Wrap paragraph" },
  }

  require("wrapping").setup {}
end

return M
