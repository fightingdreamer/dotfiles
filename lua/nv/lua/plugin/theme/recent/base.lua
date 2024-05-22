local function opts()
  return {}
end

local function config(_, opts)
  require("base").setup(opts)
  vim.cmd.colorscheme "base-blossom-light"
end

return {
  "aikow/base.nvim",
  priority = 1000,
  config = config,
  lazy = false,
  opts = opts,
}
