-- https://github.com/famiu/bufdelete.nvim
local M = {
  "famiu/bufdelete.nvim",
  event = "VeryLazy",
  keys = {
    { "<C-q>", "<cmd>Bdelete!<CR>", desc = "Delete buffer" },
  },
}

return M
