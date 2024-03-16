local lazy = require("lazy")

lazy.setup({
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = require('config.which-key')
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>f', builtin.find_files, {})
      vim.keymap.set('n', '<leader>b', builtin.buffers, {})
    end
  },
  {
    'tzachar/cmp-ai',
    dependencies = 'nvim-lua/plenary.nvim',
    config = require('config.cmp-ai')
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'tzachar/cmp-ai' },
    config = require('config.cmp')
  },
  {
    'tpope/vim-commentary'
  }
})
