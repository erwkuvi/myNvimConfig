local Plugins = {
  {'tpope/vim-fugitive'},
  {'wellle/targets.vim'},
  {'tpope/vim-repeat'},
  {'nvim-tree/nvim-web-devicons', lazy = true},
  {'numToStr/Comment.nvim', config = true, event = 'VeryLazy'},

  -- Themes
	{'catppuccin/nvim', name = "catppuccin", priority = 1000},
  {'folke/tokyonight.nvim'},
  {'joshdick/onedark.vim'},
  {'tanvirtin/monokai.nvim'},
  {'lunarvim/darkplus.nvim'},
}

return Plugins
