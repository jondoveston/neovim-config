return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- https://github.com/neovim/nvim-lspconfig
  require "configs.lspconfig",

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },

  -- https://github.com/mrjones2014/smart-splits.nvim
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    config = function()
      require "configs.smart-splits"
    end,
  },
}
