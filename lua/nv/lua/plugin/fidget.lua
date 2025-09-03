-- Extensible UI for Neovim notifications and LSP progress messages.

return {
  "j-hui/fidget.nvim",

  opts = {
    progress = {
      poll_rate = 3,
      display = {
        done_ttl = 1,
        done_icon = "✓",
        progress_icon = {
          pattern = "line",
          period = 2,
        },
      },
    },
    notification = {
      poll_rate = 3,
      view = {
        stack_upwards = false,
      },
    },
  },

  event = "VeryLazy",
}
