-- https://github.com/nvim-lualine/lualine.nvim
local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "AndreM222/copilot-lualine",
  },
}

function M.config()
  local spaces = function()
    return "s:"
      .. vim.api.nvim_buf_get_option(0, "shiftwidth")
      .. " t:"
      .. vim.api.nvim_buf_get_option(0, "textwidth")
      .. " w:"
      .. require("wrapping").get_current_mode()
  end

  local gitlab_status = function()
    return vim.b.gitlab_status_label or ""
  end

  require("lualine").setup {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      ignore_focus = { "NvimTree" },
    },
    sections = {
      lualine_a = {},
      lualine_b = { "branch" },
      lualine_c = { "diagnostics", { "filename", path = 1 } },
      lualine_x = { gitlab_status, spaces, "filetype" },
      lualine_y = { "progress" },
      lualine_z = {},
    },
    extensions = { "quickfix", "man", "fugitive", "trouble" },
  }
end

return M
