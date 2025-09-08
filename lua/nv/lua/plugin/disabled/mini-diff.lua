-- Work with diff hunks.

return {
  "nvim-mini/mini.diff",

  version = "*",

  opts = {
    view = {
      style = "sign",
      signs = {
        add = "┃",
        change = "┃",
        delete = "┃",
      },
      priority = 1,
    },
  },

  event = "VeryLazy",

  -- keys = {
  --   { "gh", mode = { "n", "v" }, desc = "git stage region" },
  --   { "gH", mode = { "n", "v" }, desc = "git reset region" },
  -- },
}
