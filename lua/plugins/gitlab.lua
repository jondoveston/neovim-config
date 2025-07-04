local M1 = {
  "https://gitlab.com/jondoveston/gitlab.vim.git",
  branch = "experimental-branch",
  -- Activate when a file is created/opened
  event = { "BufReadPre", "BufNewFile" },
  -- Activate when a supported filetype is open
  ft = { "go", "javascript", "python", "ruby" },
  cond = function()
    -- Only activate if token is present in environment variable.
    -- Remove this line to use the interactive workflow.
    return vim.env.GITLAB_TOKEN ~= nil and vim.env.GITLAB_TOKEN ~= ""
  end,
  opts = {
    statusline = {
      -- Hook into the built-in statusline to indicate the status
      -- of the GitLab Duo Code Suggestions integration
      enabled = false,
    },
    code_suggestions = {
      auto_filetypes = {
        "c", -- C
        "cpp", -- C++
        "csharp", -- C#
        "go", -- Golang
        "java", -- Java
        "javascript", -- JavaScript
        "javascriptreact", -- JavaScript React
        "kotlin", -- Kotlin
        "markdown", -- Markdown
        "objective-c", -- Objective-C
        "objective-cpp", -- Objective-C++
        "php", -- PHP
        "python", -- Python
        "ruby", -- Ruby
        "rust", -- Rust
        "scala", -- Scala
        "sql", -- SQL
        "swift", -- Swift
        "terraform", -- Terraform
        "typescript", -- TypeScript
        "typescriptreact", -- TypeScript React
        "sh", -- Shell scripts
        "html", -- HTML
        "css", -- CSS
      },
    },
  },
}

local M2 = {
  -- Assuming you init/setup snacks.nvim in a different file
  "folke/snacks.nvim",
  opts = function()
    Snacks.toggle
      .new({
        id = "GitLab Code Suggestions",
        name = "GitLab Code Suggestions",
        get = function()
          return vim.b.gitlab_status_label == "enabled"
        end,
        set = function(_)
          vim.cmd [[execute "insert \<Plug>GitLabToggleCodeSuggestions"]]
          -- vim.cmd [[execute "insert \<Plug>GitLabCodeSuggestionsStart"]]
          -- vim.cmd [[execute "insert \<Plug>GitLabCodeSuggestionsStop"]]
        end,
      })
      :map "<leader>ug"
  end,
}

return { M1, M2 }
