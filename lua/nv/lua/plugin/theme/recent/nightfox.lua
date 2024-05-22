local opts = function()
  return {}
end
local config = function(_, opts)
  require("nightfox").setup(opts)

  -- light
  vim.opt.background = "light"
  vim.cmd.colorscheme "dayfox"

  -- dark
  -- vim.opt.background = "dark"
  -- vim.cmd.colorscheme "nightfox"
end

return {
  "EdenEast/nightfox.nvim",
  priority = 1000,
  config = config,
  lazy = false,
  opts = opts,
}
