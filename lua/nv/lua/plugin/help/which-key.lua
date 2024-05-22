local opts = function()
  return {}
end

local config = function(_, opts)
  require("which-key").setup(opts)
end

return {
  "folke/which-key.nvim",
  config = config,
  event = "UIEnter",
  opts = opts,
}
