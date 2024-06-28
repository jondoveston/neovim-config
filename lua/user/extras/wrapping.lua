-- https://github.com/andrewferrier/wrapping.nvim
local M = {
  "andrewferrier/wrapping.nvim",
  event = { "BufWinEnter" },
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>wt"] = { "<cmd>ToggleWrapMode<cr>", "Toggle wrap mode" },
    ["<leader>wp"] = { "gwip", "Wrap paragraph" },
  }

  require("wrapping").setup {}
end

return M
