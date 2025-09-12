vim.api.nvim_create_user_command("W", ":w", {})
vim.api.nvim_create_user_command("Q", ":qall!", {})

vim.api.nvim_create_autocmd("WinEnter", {
  pattern = { "*" },
  command = "set cursorline cursorcolumn",
})

vim.api.nvim_create_autocmd("WinLeave", {
  pattern = { "*" },
  command = "set nocursorline nocursorcolumn",
})
