local Plugin = {'williamboman/mason.nvim'}

Plugin.lazy = false

-- See :help mason-settings
Plugin.opts = {
  ui = {border = 'rounded'},
	ensure_installed = {
		"clangd"
	}
}

return Plugin

