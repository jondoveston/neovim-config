local M = {
  "David-Kunz/gen.nvim",
  event = "VeryLazy",
  cond = function()
    return vim.env.OLLAMA_HOST ~= nil and vim.env.OLLAMA_HOST ~= ''
  end,
}

function M.config()
  local ollama_host = vim.env.OLLAMA_HOST or "localhost:11434"
  local host, port = ollama_host:match "(.-):(.*)"

  require("gen").setup {
    model = "mistral",
    -- model = "codellama:7b-code",
    host = host,
    port = port,
  }
end

return M
