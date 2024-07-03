local function opts()
  return {
    progress = {
      display = {
        done_ttl = 1,
        done_icon = "✓",
        progress_icon = {
          pattern = "line",
          period = 1,
        },
      },
    },
    notification = {
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
