vim.g.mapleader = " "

-- Proper replacing
vim.keymap.set('v', 'P', '"0P', { noremap = true })

-- Copy to system clipboard
vim.keymap.set('v', 'Y', '"+y', { noremap = true })

-- Navigate to prev/next location
vim.keymap.set('n', '<M-9>', '<C-o>', { noremap = true })
vim.keymap.set('n', '<M-0>', '<C-i>', { noremap = true })

-- Clear search highlights
vim.keymap.set('n', '<Tab>', ':nohlsearch<CR>', { noremap = true })

-- Scroll screen
-- vim.keymap.set('n', '<C-j>', '<C-e>')
-- vim.keymap.set('n', '<C-k>', '<C-y>')

-- Absolute navigation over wrapped lines
vim.api.nvim_set_keymap("n", "j", "v:count ? 'j' : 'gj'", { noremap = true, expr = true })
vim.api.nvim_set_keymap("n", "k", "v:count ? 'k' : 'gk'", { noremap = true, expr = true })

-- Modifier navigation over splits
vim.keymap.set('n', '<M-h>', '<C-w>h')
vim.keymap.set('n', '<M-l>', '<C-w>l')
vim.keymap.set('n', '<M-j>', '<C-w>j')
vim.keymap.set('n', '<M-k>', '<C-w>k')
