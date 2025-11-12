local M = {
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
  keys = {
    {
      "<leader>gm",
      function()
        local branch = vim.fn.system("git branch --show-current"):gsub("\n", "")
        local obj = vim.system({ "glab", "mr", "view", "-F", "json", branch }, { text = true }):wait()

        if obj.code == 0 and obj.stdout and obj.stdout ~= "" then
          local ok, data = pcall(vim.json.decode, obj.stdout)

          if ok and data.web_url then
            vim.cmd("edit " .. data.web_url)
            vim.notify("Editing MR: " .. data.title, vim.log.levels.INFO)
          else
            vim.notify("JSON parse error: ", vim.log.levels.WARN)
          end
        else
          vim.notify("No MR found for branch: " .. branch, vim.log.levels.WARN)
        end
      end,
      desc = "Edit MR description",
    },
    {
      "<leader>gv",
      function()
        local branch = vim.fn.system("git branch --show-current"):gsub("\n", "")
        local obj = vim.system({ "glab", "mr", "view", "-F", "json", branch }, { text = true }):wait()

        if obj.code == 0 and obj.stdout and obj.stdout ~= "" then
          local ok, data = pcall(vim.json.decode, obj.stdout)

          if ok and data.web_url then
            vim.fn.system("glab mr view --web")
            vim.notify("Opening MR: " .. data.title, vim.log.levels.INFO)
          else
            vim.notify("JSON parse error: ", vim.log.levels.WARN)
          end
        else
          vim.notify("No MR found for branch: " .. branch, vim.log.levels.WARN)
        end
      end,
      desc = "Open MR in browser",
    },
    {
      "<leader>go",
      function()
        local file = vim.fn.expand("%:p")
        local git_root = vim.fn.system("git rev-parse --show-toplevel"):gsub("\n", "")
        local relative_path = file:gsub("^" .. vim.pesc(git_root) .. "/", "")
        local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("\n", "")
        local remote_url = vim.fn.system("git config --get remote.origin.url"):gsub("\n", "")

        remote_url = remote_url:gsub("git@([^:]+):", "https://%1/")
        remote_url = remote_url:gsub("%.git$", "")

        local line = vim.fn.line(".")
        local url = string.format("%s/-/blob/%s/%s#L%d", remote_url, branch, relative_path, line)

        -- Cross-platform open command
        local open_cmd
        if vim.fn.has("mac") == 1 then
          open_cmd = "open"
        elseif vim.fn.has("unix") == 1 then
          open_cmd = "xdg-open"
        elseif vim.fn.has("win32") == 1 then
          open_cmd = "start"
        end

        if open_cmd then
          vim.fn.system(string.format('%s "%s" 2>/dev/null &', open_cmd, url))
          vim.notify(string.format("Opened %s:%d in browser", relative_path, line), vim.log.levels.INFO)
        else
          vim.notify("Could not determine how to open browser", vim.log.levels.ERROR)
        end
      end,
      desc = "Open current file in browser",
    },
  },
}

return M
