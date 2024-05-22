local opts = function()
  return {}
end

local config = function(_, opts)
  require("mkdnflow").setup(opts)
end

return {
  "jakewvincent/mkdnflow.nvim",
  config = config,
  keys = {},
  opts = opts,
}
