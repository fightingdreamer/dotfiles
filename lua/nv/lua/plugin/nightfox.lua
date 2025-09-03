-- A highly customizable theme for vim and neovim with support for
-- lsp, treesitter and a variety of plugins.

local blend_colors = function(source, target, ratio)
  local color = require "nightfox.lib.color"
  return color(source):blend(color(target), ratio):to_css()
end

local dayfox_spec = function()
  local dayfox = require "nightfox.palette.dayfox"
  local spec = dayfox.generate_spec(dayfox.palette)
  local ratio = 0.05
  return {
    diag_bg = {
      error = blend_colors(spec.bg1, spec.diag.error, ratio),
      warn = blend_colors(spec.bg1, spec.diag.warn, ratio),
      info = blend_colors(spec.bg1, spec.diag.info, ratio),
      hint = blend_colors(spec.bg1, spec.diag.hint, ratio),
      ok = blend_colors(spec.bg1, spec.diag.ok, ratio),
    },
  }
end

return {
  "EdenEast/nightfox.nvim",

  opts = function()
    return {
      options = {
        styles = {
          comments = "italic",
        },
      },
      groups = {
        all = {
          LspInlayHint = { bg = "", fg = "#7f848e" },
        },
      },
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
  end,

  priority = 1000,
}
