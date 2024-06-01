local function toggle_inline_diagnostic()
  local enabled = vim.diagnostic.config().virtual_text
  vim.diagnostic.config { virtual_text = not enabled }
end

vim.keymap.set("n", "\\id", toggle_inline_diagnostic, { desc = "lsp virtual text toggle" })

vim.diagnostic.config {
  virtual_text = true,
  underline = {
    severity = vim.diagnostic.severity.ERROR,
  },
}
