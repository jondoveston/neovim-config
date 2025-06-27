-- https://github.com/nvim-treesitter/nvim-treesitter
local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
}

function M.config()
  require("nvim-treesitter.configs").setup {
    ensure_installed = {
      "bash",
      "c",
      "comment",
      "dockerfile",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "go",
      "gomod",
      "gosum",
      "gowork",
      "json",
      "lua",
      "make",
      "markdown",
      "markdown_inline",
      "python",
      "ruby",
      "ssh_config",
      "terraform",
      "vim",
      "vimdoc",
      "yaml",
    },
    highlight = { enable = false },
    indent = { enable = true },
  }
end

return M
