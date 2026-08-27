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

  { 'nvim-treesitter/nvim-treesitter',
    lazy = false, -- the `main` branch does not support lazy-loading
    build = ':TSUpdate',
    config = function()
      require("nvim-treesitter").install({ "lua", "vimdoc", "ruby", "javascript", "html", "css" })
    end
  },
  { 'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        }
      })

      local select = require("nvim-treesitter-textobjects.select")
      vim.keymap.set({ "x", "o" }, "ir", function() select.select_textobject("@block.inner", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "ar", function() select.select_textobject("@block.outer", "textobjects") end)
    end
  },

  { 'numToStr/Comment.nvim', lazy = false }, -- comment and uncomment
  'whiteinge/diffconflicts', -- git conflicts
  'tpope/vim-fugitive', -- mostly for blame
  { 'lewis6991/gitsigns.nvim', config = require('config.gitsigns') },

  { 'David-Kunz/gen.nvim', config = require('config.gen') }, -- Ollama local LLM gen AI

  'tpope/vim-projectionist',
  'ton/vim-alternate',
  'wsdjeg/vim-fetch',
  'nanotech/jellybeans.vim',
  'junegunn/seoul256.vim',

  { 'kylechui/nvim-surround', event = "VeryLazy", config = function() require("nvim-surround").setup({ }) end },

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

  { 'jinh0/eyeliner.nvim', config = function() require('eyeliner').setup({ highlight_on_key = true }) end },
})
