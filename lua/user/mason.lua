-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim
-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    {
      "williamboman/mason.nvim",
    },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
  },
}

function M.config()
  -- ensure lsp servers in lspconfig server name format
  -- for canonical list see lspconfig
  local servers = {}

  -- ensure other tools in mason name format
  local utils = {
    "shellcheck",
    "golangci-lint-langserver",
    "gopls",
    -- "gotests",
    -- "misspell",
  }

  require("mason").setup {
    ui = {
      border = "rounded",
    },
    PATH = "append", -- this will allow the system tools to override Mason
  }

  require("mason-lspconfig").setup {
    ensure_installed = servers,
    automatic_installation = true,
  }
  require("mason-tool-installer").setup {
    ensure_installed = utils,
  }
end

return M
