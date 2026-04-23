return {
  'folke/noice.nvim',
	event = 'VeryLazy',
	opts = {},
	dependencies = {
		'MunifTanjim/nui.nvim',
		-- 'folke/snacks.nvim',
		{ 'rcarriga/nvim-notify',
			opts = {
				top_down = false,
				render = "wrapped-compact",
				stages = "slide",

			}
		},
	},
}

