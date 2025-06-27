-- https://github.com/mrjones2014/smart-splits.nvim
local M = {
  "mrjones2014/smart-splits.nvim",
  lazy = false,
}

function M.config()
  require("smart-splits").setup {
    multiplexer_integration = "tmux",
  }

  local keymap = vim.keymap.set
  -- recommended mappings
  -- resizing splits
  -- these keymaps will also accept a range,
  -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
  keymap("n", "<A-h>", require("smart-splits").resize_left)
  keymap("n", "<A-j>", require("smart-splits").resize_down)
  keymap("n", "<A-k>", require("smart-splits").resize_up)
  keymap("n", "<A-l>", require("smart-splits").resize_right)
  -- moving between splits
  keymap("n", "<C-h>", require("smart-splits").move_cursor_left)
  keymap("n", "<C-j>", require("smart-splits").move_cursor_down)
  keymap("n", "<C-k>", require("smart-splits").move_cursor_up)
  keymap("n", "<C-l>", require("smart-splits").move_cursor_right)
  -- vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)
  -- swapping buffers between windows
  keymap("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
  keymap("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
  keymap("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
  keymap("n", "<leader><leader>l", require("smart-splits").swap_buf_right)
end

return M
