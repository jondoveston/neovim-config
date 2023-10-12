local M = {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "BufReadPre",
}

M.opts = {
  indent = { char = "|" },
  scope = { enabled = true },
  whitespace = { remove_blankline_trail = true },
  exclude = {
    buftypes = { "terminal", "nofile" },
    filetypes = { "help", "packer", "NvimTree" },
  }
}

return M
