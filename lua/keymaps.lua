-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader>o", ":only<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<Right>", ":bnext<CR>", opts)
keymap("n", "<Left>", ":bprevious<CR>", opts)
keymap("n", "<Leader><Space>", "<c-^>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<C-q>", "<cmd>Bdelete!<CR>", opts)

keymap("n", "<leader>w", ":write<CR>", opts)
keymap("n", ";", ":", opts)

-- Better paste
keymap("v", "p", "P", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>ft", ":Telescope treesitter<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fc", ":Telescope commands<CR>", opts)
keymap("n", "<leader>fh", ":Telescope command_history<CR>", opts)
keymap("n", "<leader>fs", ":Telescope search_history<CR>", opts)
keymap("n", "<leader>fm", ":Telescope keymaps<CR>", opts)
keymap("n", "<leader>fd", ":Telescope diagnostics<CR>", opts)
keymap("n", "<leader>fy", ":Telescope yaml_schema<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

-- Trouble
keymap("n", "<leader>xx", "<cmd>lua require'trouble'.open()<cr>", opts)
keymap("n", "<leader>xw", "<cmd>lua require'trouble'.open('workspace_diagnostics')<cr>", opts)
keymap("n", "<leader>xd", "<cmd>lua require'trouble'.open('document_diagnostics')<cr>", opts)
keymap("n", "<leader>xq", "<cmd>lua require'trouble'.open('quickfix')<cr>", opts)
keymap("n", "<leader>xl", "<cmd>lua require'trouble'.open('loclist')<cr>", opts)
keymap("n", "gR", "<cmd>lua require'trouble'.open('lsp_references')<cr>", opts)

-- function gitlab_lint()
--   local content = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")
--   local token = os.getenv "GITLAB_TOKEN"
--   local curl = require "plenary.curl"
--   local res = curl.post(
--     "https://gitlab.com/api/v4/projects/18899486/ci/lint",
--     { body = content, headers = { content_type = "application/yaml", ["PRIVATE-TOKEN"] = token }, })
--   vim.print(res)
--   vim.print(res.body)
--   vim.print(vim.fn.json_decode(res.body))
-- end
-- keymap("n", "<leader>gl", "<cmd>lua gitlab_lint()<cr>", opts)

-- Copilot
-- keymap("i", "<c-s>", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<cr>", opts)
