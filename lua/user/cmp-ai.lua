local M = {
  "tzachar/cmp-ai",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
    },
  },
}

M.name = "cmp-ai"
function M.config()
  local ollama_host = vim.env.OLLAMA_HOST or "127.0.0.1:11434"

  require("cmp_ai.config"):setup {
    max_lines = 100,
    provider = "Ollama",
    provider_options = {
      model = "codellama:7b-code",
      base_url = "http://"..ollama_host.."/api/generate",
    },
    notify = true,
    notify_callback = function(msg)
      vim.notify(msg)
    end,
    run_on_every_keystroke = false,
    ignored_file_types = {
      -- default is not to ignore
      -- uncomment to ignore in lua:
      -- lua = true
    },
  }
end

return M
