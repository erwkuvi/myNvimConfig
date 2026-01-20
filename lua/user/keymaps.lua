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
-- Delete text without affecting the unnamed register
vim.keymap.set({'n', 'x'}, 'x', '"_x') -- Delete character under the cursor
vim.keymap.set({'n', 'x'}, 'X', '"_d') -- Delete text in visual mode

-- Commands
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>') -- Save the current buffer
vim.keymap.set('n', '<leader>bq', '<cmd>bdelete<cr>') -- Close the current buffer
vim.keymap.set('n', '<leader>bl', '<cmd>buffer #<cr>') -- Switch to the last accessed buffer

vim.keymap.set('n', '<S-l>', ':bn<cr>', { noremap = true, silent = false })
vim.keymap.set('n', '<S-h>', ':bp<cr>', { noremap = true, silent = false })

-- Navigation
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Extras

vim.keymap.set('n', '<leader><CR>', 'O') --add a new line above while remaining in Normal mode
vim.keymap.set('n', '<CR>', 'o') --add a new line below while remaining in Normal mode

-- Move current line down and up
vim.keymap.set("n", "<A-j>", ":move .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":move .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("i", "<A-j>", "<Esc>:move .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("i", "<A-k>", "<Esc>:move .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":move '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":move '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set('i', 'JJ', '<Esc>', {noremap = true, silent = true}) -- Exit insert mode

--Copilot keybindings
--vim.g.copilot_no_tab_map = true;
--vim.keymap.set('i', '<C-S>', 'copilot#Accept(" ")', { silent = true, expr = true, noremap = true })

vim.keymap.set('n', "<leader>ce", ":Copilot enable<CR>", {noremap = true, silent = true })
vim.keymap.set('n', "<leader>cd", ":Copilot disable<CR>", {noremap = true, silent = true })

-- Increase current pane size by 50 pixels with <leader> + left arrow
vim.keymap.set('n', '<leader><Left>', ':vertical resize +10<CR>', { noremap = true, silent = true }) -- Increase current pane width by 10 columns

vim.keymap.set('n', '<leader><Down>', ':resize +5<CR>', { noremap = true, silent = true }) -- Increase current pane height by 5 rows







