local function opts()
  return {}
end

local function config(_, opts)
  require("trouble").setup(opts)
end

return {
  "folke/trouble.nvim",
  config = config,
  branch = "dev", -- 3.0 beta
  opts = opts,
  cmd = "Trouble",
}
