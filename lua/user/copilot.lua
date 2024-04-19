local M = {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  cmd = { "Copilot" },
  dependencies = {
    {
      "zbirenbaum/copilot-cmp",
    },
  },
}

M.name = "copilot"
function M.config()
  require("copilot_cmp").setup()
  require("copilot").setup {
    suggestion = { enabled = false },
    panel = { enabled = false },
  }
end

return M
