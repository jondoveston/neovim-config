local M = {
  "nvimtools/none-ls.nvim",
  event = "BufReadPre",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
    },
    {
      "jay-babu/mason-null-ls.nvim",
      event = { "BufReadPre", "BufNewFile" },
    },
  },
}

function M.config()
  local null_ls = require "null-ls"
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local code_actions = null_ls.builtins.code_actions
  local hover = null_ls.builtins.hover
  local completion = null_ls.builtins.completion

  null_ls.setup {
    debug = false,
    sources = {
      -- python TBD
      -- formatting.black.with { extra_args = { "--fast" } },
      -- formatting.blue,
      -- formatting.isort,
      -- formatting.usort,
      -- formatting.pyink,
      -- formatting.pyflyby,
      -- formatting.yapf,
      -- formatting.ruff,
      -- formatting.autoflake,
      -- formatting.autopep8,
      -- diagnostics.ruff,
      -- formatting.reorder_python_imports,
      -- diagnostics.flake8,
      -- diagnostics.mypy,
      -- diagnostics.pycodestyle,
      -- diagnostics.pydocstyle,
      -- diagnostics.pylama,
      -- diagnostics.pylint,
      -- diagnostics.vulture,

      -- lua
      formatting.stylua,
      -- formatting.lua_format,
      diagnostics.luacheck,
      -- diagnostics.selene,

      -- golang
      formatting.gofmt,
      -- formatting.goimports,
      -- formatting.gofumpt,
      -- formatting.golines,
      -- code_actions.gomodifytags,
      -- code_actions.impl,
      -- diagnostics.golangci_lint,
      -- diagnostics.gospel,
      -- formatting.goimports_reviser,
      -- diagnostics.revive,
      -- diagnostics.staticcheck,

      -- shell TBD
      -- formatting.shfmt,
      -- formatting.beautysh,
      -- formatting.shellharden,
      -- code_actions.shellcheck,
      -- diagnostics.shellcheck,
      -- diagnostics.zsh,

      -- crystal
      -- formatting.crystal_format,

      -- terraform
      -- formatting.terraform_fmt,

      -- json
      diagnostics.jsonlint,
      -- formatting.json_tool,

      -- ruby TBD
      -- formatting.rubocop,
      -- diagnostics.rubocop,
      -- formatting.standardrb,
      -- formatting.htmlbeautifier,
      -- formatting.rubyfmt,
      -- formatting.rufo,
      -- diagnostics.erb_lint,
      -- diagnostics.reek,

      -- ansible
      diagnostics.ansiblelint.with { temp_dir = "/tmp" },

      -- markdown TBD
      -- formatting.markdownlint,
      diagnostics.markdownlint,
      -- formatting.markdown_toc,
      formatting.mdformat.with { extra_args = { "--wrap=80", "--number" } },
      -- formatting.ocdc,
      -- formatting.remark,
      -- formatting.terrafmt,
      -- diagnostics.mdl,
      -- formatting.cbfmt,

      -- yaml
      -- diagnostics.yamllint,
      -- formatting.yamlfmt.with { extra_args = { "-formatter", "include_document_start=true" } },
      -- formatting.yq,

      -- docker
      diagnostics.hadolint,

      -- make
      diagnostics.checkmake,

      -- general
      formatting.prettier.with { filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "graphql", "handlebars", "toml" }, extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } },
      formatting.trim_whitespace,
      formatting.trim_newlines,
      diagnostics.trail_space,
      diagnostics.todo_comments,
      hover.printenv,
      -- diagnostics.semgrep,
      -- code_actions.refactoring,
      -- formatting.deno_fmt,
      -- formatting.dprint,

      -- english TBD
      hover.dictionary,
      diagnostics.misspell
      -- completion.spell.with { filetypes = { "markdown" } },
      -- diagnostics.write_good,
      -- code_actions.proselint,
      -- diagnostics.alex,
      -- diagnostics.textidote,
      -- formatting.textlint,
      -- diagnostics.vale,
      -- diagnostics.typos,
      -- diagnostics.cspell,
      -- diagnostics.codespell.with({ filetypes = { "markdown", "go" } }),
      -- formatting.codespell.with({ filetypes = { "markdown", "go" } }),
      -- diagnostics.commitlint,
    },
  }

  require("mason-null-ls").setup {
    ensure_installed = nil,
    automatic_installation = true,
  }
end

return M
