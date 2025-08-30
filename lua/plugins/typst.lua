-- https://github.com/kaarmu/typst.vim

local M = {
  "kaarmu/typst.vim",
  ft = "typst",
  lazy = false,
  dependencies = {
    {
      "chomosuke/typst-preview.nvim",
      ft = "typst",
      version = "1.*",
      opts = {},
    },
  },
}

return M
