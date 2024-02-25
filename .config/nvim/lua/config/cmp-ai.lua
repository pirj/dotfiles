local function setup()
  local cmp_ai = require('cmp_ai.config')

  cmp_ai:setup({
    max_lines = 100,
    provider = 'Ollama',
    provider_options = {
      model = 'mistral', -- this doesn't work yet https://github.com/tzachar/cmp-ai/pull/11
    },
    notify = true,
    notify_callback = function(msg) vim.notify(msg) end,
    run_on_every_keystroke = true,
    ignored_file_types = {
      -- default is not to ignore
      -- lua = true
    },
  })
end

return { setup = setup }
