local config = function()
  -- light
  -- vim.g.zenbones_lightness = "dim"
  -- vim.g.zenbones_lightness = "bright"
  -- vim.g.zenbones_darkness = "stark"
  -- vim.g.zenbones_darkness = "warm"
  vim.opt.background = "light"
  vim.cmd.colorscheme "zenbones"

  -- dark
  -- vim.opt.background = 'dark'
  -- vim.cmd.colorscheme "zenwritten"    -- neutral
  -- vim.cmd.colorscheme "kanagawabones" -- gold
end

return {
  "mcchrish/zenbones.nvim",
  dependencies = { "rktjmp/lush.nvim" },
  priority = 1000,
  config = config,
  lazy = false,
}
