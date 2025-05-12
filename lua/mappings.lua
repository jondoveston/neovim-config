require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

-- Navigate buffers

map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")
map("n", "<Right>", ":bnext<CR>")
map("n", "<Left>", ":bprevious<CR>")
map("n", "<Leader><Space>", "<c-^>")
