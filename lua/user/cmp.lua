local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "hrsh7th/cmp-nvim-lsp",
    },
    {
      "hrsh7th/cmp-buffer",
    },
    {
      "hrsh7th/cmp-path",
    },
    {
      "hrsh7th/cmp-cmdline",
    },
    {
      "saadparwaiz1/cmp_luasnip",
    },
    {
      "L3MON4D3/LuaSnip",
      event = "InsertEnter",
      dependencies = {
        "rafamadriz/friendly-snippets",
      },
    },
    {
      "hrsh7th/cmp-nvim-lua",
    },
    {
      "hrsh7th/cmp-calc",
    },
    {
      "hrsh7th/cmp-omni",
    },
    {
      "onsails/lspkind-nvim",
    },
    {
      "f3fora/cmp-spell",
    },
    {
      "tzachar/cmp-ai",
    },
  },
  event = {
    "InsertEnter",
    "CmdlineEnter",
  },
}

function M.config()
  local cmp = require "cmp"
  local luasnip = require "luasnip"
  require("luasnip/loaders/from_vscode").lazy_load()
  require("luasnip.loaders.from_lua").load { paths = "~/.config/nvim/luasnip/" }

  local lspkind = require "lspkind"

  local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
  end

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert {
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-e>"] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },
      -- Manually trigger slow completion
      ["<C-x>"] = cmp.mapping(
        cmp.mapping.complete {
          config = {
            sources = cmp.config.sources {
              { name = "cmp_ai" },
            },
          },
        },
        { "i" }
      ),
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm { select = true },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif check_backspace() then
          fallback()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },
    formatting = {
      format = lspkind.cmp_format {
        -- defines how annotations are shown
        -- default: symbol
        -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
        mode = "symbol_text",

        -- default symbol map
        -- can be either 'default' (requires nerd-fonts font) or
        -- 'codicons' for codicon preset (requires vscode-codicons font)
        --
        -- default: 'default'
        preset = "codicons",

        show_labelDetails = true,

        -- override preset symbols
        --
        -- default: {}
        symbol_map = {
          Text = "󰉿",
          Method = "󰆧",
          -- Method = "m",
          Function = "󰊕",
          Constructor = "",
          -- Constructor = "",
          Field = "󰜢",
          -- Field = "",
          Variable = "󰀫",
          -- Variable = "󰆧",
          Class = "󰠱",
          -- Class = "󰌗",
          Interface = "",
          Module = "",
          Property = "󰜢",
          -- Property = "",
          Unit = "󰑭",
          Value = "󰎠",
          Enum = "",
          Keyword = "󰌋",
          Snippet = "",
          -- Snippet = "",
          Color = "󰏘",
          File = "󰈙",
          Reference = "󰈇",
          -- Reference = "",
          Folder = "󰉋",
          EnumMember = "",
          Constant = "󰏿",
          -- Constant = "󰇽",
          Struct = "󰙅",
          -- Struct = "",
          Event = "",
          Operator = "󰆕",
          TypeParameter = "󰊄",
          Codeium = "󰚩",
          Copilot = "",
          LLM = "󰧑",
        },
        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        before = function(entry, vim_item)
          if entry.source.name == "cmp_ai" then
            vim_item.kind = "LLM"
          end
          return vim_item
        end,
      },
    },
    sources = {
      { name = "copilot" },
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
      { name = "calc" },
      -- { name = "cmp_ai" },
      { name = "omni", option = { disable_omnifuncs = { "v:lua.vim.lsp.omnifunc" } } },
      {
        name = "spell",
        option = {
          keep_all_entries = false,
          enable_in_context = function()
            return true
          end,
        },
      },
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    experimental = {
      ghost_text = true,
    },
  }
end

return M
