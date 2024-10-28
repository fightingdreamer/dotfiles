local opts = function()
  return {
    -- Use `''` (empty string) to disable mapping.
    mappings = {
      start = "ga",
      start_with_preview = "gA",
    },
  }
end

local config = function(_, opts)
  require("mini.align").setup(opts)
end

return {
  -- Align text interactively
  "echasnovski/mini.align",
  version = "*",
  config = config,
  opts = opts,
  keys = {
    { "ga", mode = { "n", "v" }, desc = "Mini-align start" },
    { "gA", mode = { "n", "v" }, desc = "Mini-align start with preview" },
  },
}
