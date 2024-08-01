local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end
load('user.settings')
load('user.commands')
load('user.keymaps')
require('user.plugins')
 
pcall(vim.cmd.colorscheme, 'slate')
-- pcall(vim.cmd.colorscheme, 'tokyonight-moon')
