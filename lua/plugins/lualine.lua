local Plugin = {'nvim-lualine/lualine.nvim',
								dependencies = {'nvim-tree/nvim-web-devicons'}
								}

Plugin.event = 'VeryLazy'

-- See :help lualine.txt
Plugin.opts = {
  options = {
    theme = 'catppuccin',
		icons_enabled = true,
		section_separators   = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    --[[ disabled_filetypes = {
      statusline = { 'NvimTree', 'alpha' },
      winbar     = {},
    }, ]]
    -- always_divide_middle = true,
    globalstatus = true,
  },
	sections = {
		lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = {
      { 'filename', path = 1 }, -- 0: name, 1: relative, 2: absolute
    },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_y = {
      { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
      { 'location', padding = { left = 0, right = 1 } },
    },
		lualine_z = {
      {
        function()
          return ' ' .. os.date('%R')
        end,
        separator = { right = '' },
      },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
  }
}

function Plugin.init()
  vim.opt.showmode = false
end

return Plugin
