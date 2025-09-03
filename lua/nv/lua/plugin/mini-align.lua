-- Align text interactively.

return {
  "echasnovski/mini.align",

  version = "*",

  opts = {
    -- Use `''` (empty string) to disable mapping.
    mappings = {
      start = "ga",
      start_with_preview = "gA",
    },
  },

  keys = {
    { "ga", mode = { "n", "v" }, desc = "Align" },
    { "gA", mode = { "n", "v" }, desc = "Align with preview" },
  },
}
