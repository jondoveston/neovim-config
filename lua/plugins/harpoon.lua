-- https://github.com/ThePrimeagen/harpoon
local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
}

function M.config()
  local harpoon = require('harpoon')
  harpoon:setup()

  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  keymap("n", "<s-m>", function() harpoon:list():add() end, opts)
  keymap("n", "<TAB>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, opts)
end

return M
