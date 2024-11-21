local opts = function()
  return {}
end

local config = function(_, opts)
  vim.api.nvim_set_hl(0, "QuickScopePrimary", { underline = true })
  vim.api.nvim_set_hl(0, "QuickScopeSecondary", {})
end

return {
  -- An always-on highlight for a unique character in every word on a line to help you use f, F and family.
  "unblevable/quick-scope",
  config = config,
  event = "UIEnter",
  opts = opts,
}
