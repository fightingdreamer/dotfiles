local function opts()
  return {
    rocks = {},
  }
end

local function config(_, opts)
  require("luarocks-nvim").setup(opts)
end

-- :Lazy build luarocks.nvim
return {
  "vhyrro/luarocks.nvim",
  config = config,
  opts = opts,
  cmd = { "RocksInstall" },
}
