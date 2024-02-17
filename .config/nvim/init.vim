source ~/.vimrc

lua <<EOF
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    -- bootstrap lazy.nvim
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  end
  vim.opt.rtp:prepend(lazypath)

  vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

  -- init lazy.vim
  require("lazy").setup({
    "folke/which-key.nvim",
  })
EOF
