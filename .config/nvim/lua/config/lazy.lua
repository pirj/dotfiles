local lazy = require("lazy")

lazy.setup({
  { "folke/which-key.nvim", event = "VeryLazy", config = require('config.which-key') },
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
  { 'hrsh7th/nvim-cmp', dependencies = { 'hrsh7th/cmp-buffer' }, config = require('config.cmp') },
  { 'numToStr/Comment.nvim', lazy = false },
  'whiteinge/diffconflicts',
  'tpope/vim-fugitive', -- mostly for blame
  'airblade/vim-gitgutter', -- show git changes
  { 'David-Kunz/gen.nvim', config = require('config.gen') }, -- Ollama local LLM gen AI
})
