-- Add this inside your LazyVim plugin setup
return {
  -- Other plugins...
  {
    "github/copilot.vim",  -- GitHub Copilot plugin for Neovim
    config = function()
      -- Optional: Configure GitHub Copilot if needed
			vim.cmd("Copilot disable")
			vim.g.copilot_no_tab_map = true

      -- Keybinding to accept Copilot suggestion with <C-J>
      vim.keymap.set('i', '<c-q>', 'copilot#Accept("<CR>")', { expr = true, silent = true, noremap = true, replace_keycodes = false })

    end,
  },
}

