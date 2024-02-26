local M = {
  -- 'git@gitlab.com:gitlab-org/editor-extensions/gitlab.vim.git',
  'https://gitlab.com/gitlab-org/editor-extensions/gitlab.vim.git',
  event = { 'BufReadPre', 'BufNewFile' },
  ft = { 'go', 'javascript', 'python', 'ruby' },
  cond = function()
    return vim.env.GITLAB_TOKEN ~= nil and vim.env.GITLAB_TOKEN ~= ''
  end,
  opts = {
    statusline = {
      enabled = false,
    },
  },
}

M.name = "gitlab"
function M.config()
  require("gitlab").setup()
end

return M
