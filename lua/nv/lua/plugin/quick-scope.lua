-- An always-on highlight for a unique character in every word on a line
-- to help you use f, F, and family.

return {
  "unblevable/quick-scope",

  init = function()
    vim.api.nvim_set_hl(0, "QuickScopePrimary", { underline = true })
    vim.api.nvim_set_hl(0, "QuickScopeSecondary", {})
  end,
  config = false,

  event = "VeryLazy",
}
