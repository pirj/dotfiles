return function()
  local cmp = require('cmp')
  cmp.setup({
    experimental = {
      ghost_text = true
    },
    window = {
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then cmp.select_next_item() end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then cmp.select_prev_item() end
      end, { "i", "s" }),
      -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['ff'] = cmp.mapping.confirm({ select = false }),
    }),
    sources = {
      {
        name = 'buffer',
        option = {
          get_bufnrs = function()
            return vim.api.nvim_list_bufs()
          end
        }
      }
    }
  })
end
