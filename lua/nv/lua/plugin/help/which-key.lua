local opts = function()
  return {
    marsk = false,
    triggers = {},
    registers = false,
  }
end

local config = function(_, opts)
  require("which-key").setup(opts)
end

return {
  "folke/which-key.nvim",
  config = config,
  opts = opts,
  keys = {
    { "\\\\", "<cmd>WhichKey<cr>", desc = "which-key open popup" },
  },
  cmd = "WhichKey",
}
