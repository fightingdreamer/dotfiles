local function _config()
  require("grug-far").setup {}
end

local _grug_open = function()
  require("grug-far").open()
end

return {
  "MagicDuck/grug-far.nvim",
  config = _config,
  keys = {
    { mode = { "n", "v" }, "<leader>S", _grug_open, desc = "Spectre: search in current file" },
  },
  cmd = "GrugFar",
}
