local M = {
  "folke/trouble.nvim",
  dependencies = {
    {
      "nvim-tree/nvim-web-devicons",
    },
  },
}

M.name = "trouble"
function M.config()
  require("trouble").setup()
end

return M
