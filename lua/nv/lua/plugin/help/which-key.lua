local _opts = function()
  return {
    marsk = false,
    triggers = {},
    registers = false,
    icons = {
      mappings = false,
    },
  }
end

local _config = function(_, opts)
  require("which-key").setup(opts)
end

return {
  "folke/which-key.nvim",
  config = _config,
  opts = _opts,
  keys = {
    { mode = { "n", "v" }, "\\\\", "<cmd>WhichKey<cr>", desc = "which-key open popup" },
  },
  cmd = "WhichKey",
}
