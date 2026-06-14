-- WhichKey helps you remember your Neovim keymaps, by showing available
-- keybindings in a popup as you type.

return {
  "folke/which-key.nvim",

  opts = {
    marsk = false,
    triggers = {},
    registers = false,
    icons = {
      mappings = false,
    },
  },

  keys = {
    { mode = { "n", "v" }, "\\\\", "<cmd>WhichKey<cr>", desc = "Which key" },
  },
  cmd = {
    "WhichKey",
  },
}
