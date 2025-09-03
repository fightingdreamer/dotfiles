-- Faster LuaLS setup for Neovim.

return {
  "folke/lazydev.nvim",

  opts = {
    library = {
      { path = "nvim-dap-ui", words = { "nvim-dap-ui" } },
    },
  },

  ft = "lua",
}
