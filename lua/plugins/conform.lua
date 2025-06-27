-- https://github.com/stevearc/conform.nvim
return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "<leader>F",
        function()
          require("conform").format { async = true }
        end,
        mode = "",
        desc = "ConFormat buffer",
      },
    },
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      -- Define your formatters
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        ruby = { "rubocop" },
      },
      -- Set default options
      default_format_opts = {
        lsp_format = "fallback",
      },
      -- Set up format-on-save
      format_on_save = function(bufnr)
        if vim.g.autoformat then
          local disable_filetypes = {}
          local lsp_format_opt
          if disable_filetypes[vim.bo[bufnr].filetype] then
            lsp_format_opt = "never"
          else
            lsp_format_opt = "fallback"
          end
          return {
            timeout_ms = 500,
            lsp_format = lsp_format_opt,
          }
        else
          return
        end
      end,

      -- Customize formatters
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2" },
        },
      },
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
  { -- Assuming you init/setup snacks.nvim in a different file
    "folke/snacks.nvim",
    opts = function()
      vim.g.autoformat = true -- Sets up the default value to be true

      Snacks.toggle
        .new({
          id = "Format on Save",
          name = "Format on Save",
          get = function()
            return vim.g.autoformat
          end,
          set = function(_)
            vim.g.autoformat = not vim.g.autoformat
          end,
        })
        :map "<leader>uf"
    end,
  },
}
