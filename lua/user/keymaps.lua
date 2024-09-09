-- Space as leader key
vim.g.mapleader = ' '

-- Shortcuts
vim.keymap.set({'n', 'x', 'o'}, '<leader>h', '^')
vim.keymap.set({'n', 'x', 'o'}, '<leader>l', 'g_')
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

-- Basic clipboard interaction
vim.keymap.set({'n', 'x'}, 'gy', '"+y') -- copy
vim.keymap.set({'n', 'x'}, 'gp', '"+p') -- paste

-- Delete text
vim.keymap.set({'n', 'x'}, 'x', '"_x')
vim.keymap.set({'n', 'x'}, 'X', '"_d')

-- Commands
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')
vim.keymap.set('n', '<leader>bq', '<cmd>bdelete<cr>')
vim.keymap.set('n', '<leader>bl', '<cmd>buffer #<cr>')-- Define a key mapping for the ]n combination to execute :bn

vim.keymap.set('n', '<leader>c', ':bn<cr>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>m', ':bp<cr>', { noremap = true, silent = false })

-- Navigation
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Extras

vim.keymap.set('n', '<leader><CR>', 'O<ESC>') --add a new line above while remaining in Normal mode
vim.keymap.set('n', '<CR>', 'o<ESC>') --add a new line below while remaining in Normal mode


vim.keymap.set("n", "<A-j>", ":move .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":move .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("i", "<A-j>", "<Esc>:move .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("i", "<A-k>", "<Esc>:move .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":move '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":move '<-2<CR>gv=gv", { noremap = true, silent = true })

--Copilot keybindings
--vim.g.copilot_no_tab_map = true;
--vim.keymap.set('i', '<C-S>', 'copilot#Accept(" ")', { silent = true, expr = true, noremap = true })

vim.keymap.set('n', "<leader>ce", ":Copilot enable<CR>", {noremap = true, silent = true })
vim.keymap.set('n', "<leader>cd", ":Copilot disable<CR>", {noremap = true, silent = true })

