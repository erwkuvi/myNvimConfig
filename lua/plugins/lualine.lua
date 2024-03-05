local Plugin = {'nvim-lualine/lualine.nvim',
								dependencies = {'nvim-tree/nvim-web-devicons'}
								}

Plugin.event = 'VeryLazy'

-- See :help lualine.txt
Plugin.opts = {
  options = {
    theme = 'monokai',
    component_separators = '|',
    section_separators = '',
    disabled_filetypes = {
      statusline = {'NvimTree'}
    }
  },
}

function Plugin.init()
  vim.opt.showmode = false
end

return Plugin
