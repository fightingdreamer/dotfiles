local _opts = function()
  return {}
end

local _config = function(_, opts)
  require("ranger-nvim").setup { replace_netrw = true }
end

local _ranger_open = function()
  require("ranger-nvim").open(true)
end

return {
  "kelly-lin/ranger.nvim",
  config = _config,
  opts = _opts(),
  keys = {
    { "<leader>ef", _ranger_open, desc = "" },
  },
  enable = false,
}
