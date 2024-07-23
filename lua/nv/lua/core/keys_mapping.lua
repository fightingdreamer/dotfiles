local del = vim.keymap.del
local set = vim.keymap.set

-- save file
set("n", "<leader>w", "<cmd>:w<cr>", {desc = "save file"})
set("n", "<leader>W", "<cmd>:w!<cr>", {desc = "save file!"})

-- unbind default commenting
del("n", "gcc")
del("v", "gc")

-- paste keeping register
set("v", "P", '"0P', { noremap = true })

-- copy to system clipboard
set("v", "Y", '"+y', { noremap = true })

-- navigate to prev/next location
set("n", "<M-9>", "<C-o>", { noremap = true })
set("n", "<M-0>", "<C-i>", { noremap = true })

-- scroll screen
-- set("n", "<C-j>", "<C-e>")
-- set("n", "<C-k>", "<C-y>")

-- clear search highlights
set("n", "<tab>", "<cmd>nohlsearch<cr>", { noremap = true, desc = "clear highlights" })

-- absolute navigation over wrapped lines
set("n", "j", "v:count ? 'j' : 'gj'", { noremap = true, expr = true })
set("n", "k", "v:count ? 'k' : 'gk'", { noremap = true, expr = true })

-- option/alt navigation over splits
-- set("n", "<M-h>", "<C-w>h")
-- set("n", "<M-l>", "<C-w>l")
-- set("n", "<M-j>", "<C-w>j")
-- set("n", "<M-k>", "<C-w>k")

-- todo

-- map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
-- map("i", "<C-e>", "<End>", { desc = "move end of line" })
-- map("i", "<C-h>", "<Left>", { desc = "move left" })
-- map("i", "<C-l>", "<Right>", { desc = "move right" })
-- map("i", "<C-j>", "<Down>", { desc = "move down" })
-- map("i", "<C-k>", "<Up>", { desc = "move up" })

-- map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
-- map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
-- map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
-- map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
--
-- map("n", "<C-s>", "<cmd>w<CR>", { desc = "file save" })
-- map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "file copy whole" })
--
-- map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
-- map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

-- -- global lsp mappings
-- map("n", "<leader>lf", vim.diagnostic.open_float, { desc = "lsp floating diagnostics" })
-- map("n", "[d", vim.diagnostic.goto_prev, { desc = "lsp prev diagnostic" })
-- map("n", "]d", vim.diagnostic.goto_next, { desc = "lsp next diagnostic" })
-- map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "lsp diagnostic loclist" })
--
-- -- tabufline
-- map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })
--
-- map("n", "<tab>", function()
--   require("nvchad.tabufline").next()
-- end, { desc = "buffer goto next" })
--
-- map("n", "<S-tab>", function()
--   require("nvchad.tabufline").prev()
-- end, { desc = "buffer goto prev" })
--
-- map("n", "<leader>x", function()
--   require("nvchad.tabufline").close_buffer()
-- end, { desc = "buffer close" })
--
-- -- Comment
-- map("n", "<leader>/", function()
--   require("Comment.api").toggle.linewise.current()
-- end, { desc = "comment toggle" })
--
-- map(
--   "v",
--   "<leader>/",
--   "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
--   { desc = "comment toggle" }
-- )
--
-- -- terminal
-- map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
--
-- -- new terminals
-- map("n", "<leader>h", function()
--   require("nvchad.term").new { pos = "sp" }
-- end, { desc = "terminal new horizontal term" })
--
-- map("n", "<leader>v", function()
--   require("nvchad.term").new { pos = "vsp" }
-- end, { desc = "terminal new vertical window" })
--
-- -- toggleable
-- map({ "n", "t" }, "<A-v>", function()
--   require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
-- end, { desc = "terminal toggleable vertical term" })
--
-- map({ "n", "t" }, "<A-h>", function()
--   require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
-- end, { desc = "terminal new horizontal term" })
--
-- map({ "n", "t" }, "<A-i>", function()
--   require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
-- end, { desc = "terminal toggle floating term" })
--
-- -- whichkey
-- map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })
--
-- map("n", "<leader>wk", function()
--   vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
-- end, { desc = "whichkey query lookup" })
--
-- -- blankline
-- map("n", "<leader>cc", function()
--   local config = { scope = {} }
--   config.scope.exclude = { language = {}, node_type = {} }
--   config.scope.include = { node_type = {} }
--   local node = require("ibl.scope").get(vim.api.nvim_get_current_buf(), config)
--
--   if node then
--     local start_row, _, end_row, _ = node:range()
--     if start_row ~= end_row then
--       vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
--       vim.api.nvim_feedkeys("_", "n", true)
--     end
--   end
-- end, { desc = "blankline jump to current context" })