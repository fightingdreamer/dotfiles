local function opts()
  return {
    history = true,
    updateevents = "TextChanged,TextChangedI",
  }
end

local function config(_, opts)
  require("luasnip").config.set_config(opts)
end

return {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = config,
  opts = opts,
}
