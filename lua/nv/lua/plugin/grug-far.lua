-- Find and replace plugin for neovim.

local m = {
  open = function()
    require("grug-far").open()
  end,
}

return {
  "MagicDuck/grug-far.nvim",

  keys = {
    { mode = { "n", "v" }, "<leader>S", m.open, desc = "Search and replace" },
  },
  cmd = "GrugFar",
}
