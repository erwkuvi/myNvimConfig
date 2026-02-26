return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  build = "make",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    provider = "copilot",
  },
}


-- local cmp = require('cmp')
-- local avante = require('avante')
--
-- cmp.setup({
--   sources = {
--     { name = 'avante' }, -- Add avante as a source for nvim-cmp
--     -- Add other sources as needed
--   },
--   mapping = {
--     ['<C-Space>'] = cmp.mapping.complete(),
--     ['<CR>'] = cmp.mapping.confirm({ select = true }),
--   },
-- })
--
-- avante.setup({
--   auto_suggestions_provider = "copilot",
--   provider = "copilot",
--   openai = {
--     endpoint = "https://api.githubcopilot.com",
--     model = "gpt-4o-2024-08-06",
--     proxy = nil,
--     allow_insecure = false,
--     timeout = 30000,
--     temperature = 0,
--     max_tokens = 4096
--   }
-- })

