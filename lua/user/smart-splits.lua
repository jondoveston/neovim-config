local M = {
  "mrjones2014/smart-splits.nvim",
  lazy = false,
}

function M.config()
  require("smart-splits").setup {
    multiplexer_integration = "tmux",
  }
end

return M
