return {
	{
		"luckasRanarison/tailwind-tools.nvim",
		name = "tailwind-tools",
		build = ":UpdateRemotePlugins",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			server = {
				override = false,
			},
		}
	},
	{
		"NvChad/nvim-colorizer.lua",
			opts = {
				user_default_options = {
					tailwind = true,
				},
			}
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{"roobert/tailwindcss-colorizer-cmp.nvim", config = true },
		},
	},
}
