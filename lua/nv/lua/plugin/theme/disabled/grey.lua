local function opts()
  return {}
end

local function config(_, opts)
  vim.cmd.colorscheme "grey"
end

return {
  "yorickpeterse/nvim-grey",
  priority = 1000,
  config = config,
  lazy = false,
  opts = opts,
}
