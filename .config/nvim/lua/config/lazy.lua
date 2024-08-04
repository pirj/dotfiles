local lazy = require("lazy")

lazy.setup({
  { "folke/which-key.nvim", event = "VeryLazy", config = require('config.which-key') },
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional for icon support
      { "junegunn/fzf", build = "./install --bin" } -- not using it outside of vim
    },
    config = function()
      local fzf = require("fzf-lua")
      vim.keymap.set("n", "<leader>f", fzf.files)
      vim.keymap.set("n", "<leader>b", fzf.buffers)
    end
  },
  { 'hrsh7th/nvim-cmp', dependencies = { 'hrsh7th/cmp-buffer' }, config = require('config.cmp') },
  { 'numToStr/Comment.nvim', lazy = false }, -- comment and uncomment
  'whiteinge/diffconflicts', -- git conflicts
  'tpope/vim-fugitive', -- mostly for blame
  { 'lewis6991/gitsigns.nvim', config = require('config.gitsigns') },

  { 'David-Kunz/gen.nvim', config = require('config.gen') }, -- Ollama local LLM gen AI

  'tpope/vim-projectionist',
  'uptech/vim-open-alternate',
  'kopischke/vim-fetch',
  'nathanaelkane/vim-indent-guides',
  'nanotech/jellybeans.vim',
  'junegunn/seoul256.vim',

  'tpope/vim-surround',
  'ervandew/supertab',

  'ap/vim-css-color', -- CSS color previews

  -- Ruby syntax
  'neovim/neovim-ruby',
  'tpope/vim-rails',
  'slim-template/vim-slim',
  'joker1007/vim-ruby-heredoc-syntax',
  'thoughtbot/vim-rspec',

  'tpope/vim-repeat', -- better repeat

  'jgdavey/tslime.vim', -- tmux support
  'wincent/terminus', -- better terminal integration
})
