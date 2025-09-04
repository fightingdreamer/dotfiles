-- Trim all trailing whitespace.

local m = {
  trim = function()
    require("mini.trailspace").trim()
  end,

  trim_last_lines = function()
    require("mini.trailspace").trim_last_lines()
  end,
}

return {
  "echasnovski/mini.trailspace",
  version = "*",

  keys = {
    { "<leader>;", m.trim, desc = "mini.trailspace trim trailing whitespace" },
    { "<leader>\\", m.trim_last_lines, desc = "mini.trailspace trim last blank lines" },
  },
}
