-- note: note
--       lorem ipsum dolor sit amet

-- link: link
--       lorem ipsum dolor sit amet

-- idea: idea
--       lorem ipsum dolor sit amet

-- todo: note
--       lorem ipsum dolor sit amet

-- warn: warn
--       lorem ipsum dolor sit amet

-- perf: perf
--       lorem ipsum dolor sit amet

-- test: test
--       lorem ipsum dolor sit amet

local function opts()
  return {
    keywords = {
      -- https://www.nerdfonts.com/cheat-sheet
      -- double                         
      -- single 󰙨
      note = { icon = " ", color = "hint" },
      link = { icon = " ", color = "hint" },
      idea = { icon = " ", color = "info" },
      todo = { icon = " ", color = "info" },
      warn = { icon = " ", color = "error" },
      perf = { icon = " ", color = "warning" },
      test = { icon = " ", color = "test" },
    },
    merge_keywords = false,
    highlight = {
      multiline = true,
      multiline_pattern = "^      .",
      -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty.
      keyword = "wide_fg",
      -- "fg" or "bg" or empty.
      after = "fg",
      comments_only = false,
    },
  }
end

local function jump_prev()
  require("todo-comments").jump_prev()
end

local function jump_next()
  require("todo-comments").jump_next()
end

return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "folke/trouble.nvim" },
    event = "BufReadPost",
    opts = opts,
    keys = {
      { "<leader>T", "<cmd>TodoTrouble<cr>", mode = "n", desc = "TodoComments: show" },
      { "[t", jump_prev, mode = "n", desc = "TodoComments: jump prev" },
      { "]t", jump_next, mode = "n", desc = "TodoComments: jump next" },
    },
  },
}
