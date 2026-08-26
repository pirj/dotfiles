source ~/.config/vim/bindings.vim " All hotkeys, not depedant on plugins, are bound here.

lua <<EOF
  -- Bootstrap lazy.nvim
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { out, "WarningMsg" },
        { "\nPress any key to exit..." },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
    end
  end
  vim.opt.rtp:prepend(lazypath)

  --  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
  vim.g.mapleader = " "
  vim.g.maplocalleader = "\\"

  require("config/lazy")
EOF

source ~/.config/vim/config.vim " All of the Vim configuration.
source ~/.config/vim/autocmd.vim " Autocommands
