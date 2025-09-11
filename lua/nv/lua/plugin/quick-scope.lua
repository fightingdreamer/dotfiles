-- An always-on highlight for a unique character in every word on a line
-- to help you use f, F, and family.

return {
  "unblevable/quick-scope",

  init = function()
    vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
    vim.api.nvim_set_hl(0, "QuickScopePrimary", { reverse = true })
    vim.api.nvim_set_hl(0, "QuickScopeSecondary", { reverse = true })
  end,
  config = false,

  event = "VeryLazy",
}
