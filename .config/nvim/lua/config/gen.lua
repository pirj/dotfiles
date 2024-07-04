return function()
  vim.keymap.set({ 'n', 'v' }, '<leader>e', ':Gen<CR>')

  local gen = require('gen')
  gen.setup({
    model = "codestral"
  })
end
