local opts = function()
  return {}
end

local config = function(_, opts)
  require("tinygit").setup(opts)
end

return {
  -- A lightweight bundle of commands focussed on swift and streamlined git operations.
  "chrisgrieser/nvim-tinygit",
  dependencies = "stevearc/dressing.nvim",
  config = config,
  opts = opts,
  keys = {},
}
