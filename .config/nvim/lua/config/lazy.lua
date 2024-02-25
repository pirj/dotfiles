-- init lazy.vim
local lazy = require("lazy")

lazy.setup({
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = { } -- KEEP THIS, otherwise it ceases to work
  }
})
