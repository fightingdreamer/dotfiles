local function opts()
  return {
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
  }
end

local function config(_, opts)
  require("fidget").setup(opts)
end

return {
  "j-hui/fidget.nvim",
  config = config,
  event = "UIEnter",
  opts = opts,
}
