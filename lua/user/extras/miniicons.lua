-- https://github.com/echasnovski/mini.icons
local M = {
  "echasnovski/mini.icons",
  event = "VeryLazy",
  version = false,
}

function M.config()
  require('mini.icons').setup()
end

return M
