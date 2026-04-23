local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

vim.lsp.config('lua_ls', {
  capabilities = lsp_capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path
      },
      diagnostics = {
        globals = {'vim'}
      },
      workspace = {
        library = {
          vim.fn.expand('$VIMRUNTIME/lua'),
          vim.fn.stdpath('config') .. '/lua'
        },
        checkThirdParty = false
      },
      telemetry = {
        enable = false
      },
    }
  }
})

vim.lsp.enable('lua_ls')
