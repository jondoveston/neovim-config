M = {
  "adr-tools",
  dir = vim.fn.stdpath "config" .. "/adr-tools.nvim",
  config = function()
    require("adr-tools").setup()
  end,
  keys = {
    {
      "<leader>a",
      function()
        local adr = require "adr-tools"
        local files = adr.list()
        local snacks = require "snacks"
        snacks.picker {
          prompt = "Select an ADR: ",
          format = "text",
          finder = function()
            local items = {}
            for i, file in ipairs(files) do
              table.insert(items, {
                idx = i,
                file = file,
                text = vim.fn.fnamemodify(file, ":t"),
              })
            end
            return items
          end,
        }
      end,
      desc = "Select ADR",
    },
    {
      "<leader>A",
      function()
        local adr = require "adr-tools"
        local snacks = require "snacks"
        snacks.input({}, function(value)
          local file = adr.new(value)
          if file then
            vim.cmd.edit(file)
          end
        end)
      end,
      desc = "New ADR",
    },
  },
}

return M
