vim.api.nvim_create_user_command("W", ":w", {})
vim.api.nvim_create_user_command("Q", ":qall!", {})

vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter", "BufEnter", "TabEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.opt_local.cursorline = true
    vim.opt_local.cursorcolumn = true
  end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave", "TabLeave" }, {
  pattern = { "*" },
  callback = function()
    vim.opt_local.cursorline = false
    vim.opt_local.cursorcolumn = false
  end,
})
