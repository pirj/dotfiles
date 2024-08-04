lua <<EOF
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    -- bootstrap lazy.nvim
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  end
  vim.opt.rtp:prepend(lazypath)

  --  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '

  require("config.lazy")
EOF

source ~/.config/vim/config.vim " All of the Vim configuration.
source ~/.config/vim/bindings.vim " All hotkeys, not depedant on plugins, are bound here.
source ~/.config/vim/autocmd.vim " Autocommands
