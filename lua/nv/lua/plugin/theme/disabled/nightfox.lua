local function dayfox_spec()
  local C = require "nightfox.lib.color"
  local pal = require "nightfox.palette.dayfox"
  local spec = pal.generate_spec(pal.palette)
  local blend = 0.15
  return {
    diag_bg = {
      error = C(spec.bg1):blend(C(spec.diag.error), blend):to_css(),
      warn = C(spec.bg1):blend(C(spec.diag.warn), blend):to_css(),
      info = C(spec.bg1):blend(C(spec.diag.info), blend):to_css(),
      hint = C(spec.bg1):blend(C(spec.diag.hint), blend):to_css(),
      ok = C(spec.bg1):blend(C(spec.diag.ok), blend):to_css(),
    },
  }
end

local opts = function()
  return {
    palettes = {
      dayfox = {
        bg3 = "#e4dcd4", -- Lighter bg (cursor line)
        sel0 = "#e7d2be", -- Popup bg, visual selection bg
        sel1 = "#aecdcf", -- Popup sel bg, search bg
      },
    },
    specs = {
      dayfox = dayfox_spec(),
    },
  }
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
