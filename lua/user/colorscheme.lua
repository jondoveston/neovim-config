-- https://github.com/folke/tokyonight.nvim
local M = {
  "folke/tokyonight.nvim",
  -- "LunarVim/darkplus.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

-- M.name = "tokyonight-night"
function M.config()
  vim.cmd.colorscheme "tokyonight-night"

  -- local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  -- if not status_ok then
  --   return
  -- end

  -- require("tokyonight").setup {
  --   style = "storm"
  -- }
end

return M
