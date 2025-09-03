-- Highlight, list and search todo comments in your projects.

-- note: note
--       lorem ipsum dolor sit amet

-- link: link
--       lorem ipsum dolor sit amet

-- idea: idea
--       lorem ipsum dolor sit amet

-- todo: todo
--       lorem ipsum dolor sit amet
--
-- redo: redo
--       lorem ipsum dolor sit amet

-- warn: warn
--       lorem ipsum dolor sit amet

-- perf: perf
--       lorem ipsum dolor sit amet

-- test: test
--       lorem ipsum dolor sit amet

-- code: test
--       lorem ipsum dolor sit amet

local m = {
  jump_prev = function()
    require("todo-comments").jump_prev()
  end,

  jump_next = function()
    require("todo-comments").jump_next()
  end,
}

return {
  {
    "folke/todo-comments.nvim",

    dependencies = {
      "ibhagwan/fzf-lua",
    },

    opts = {
      keywords = {
        -- https://www.nerdfonts.com/cheat-sheet
        -- double           󰸳                
        -- single 󰙨
        note = { icon = " ", color = "hint" },
        link = { icon = " ", color = "hint" },
        idea = { icon = " ", color = "info" },
        todo = { icon = " ", color = "info" },
        redo = { icon = " ", color = "info" },
        warn = { icon = " ", color = "error" },
        perf = { icon = " ", color = "warning" },
        test = { icon = " ", color = "test" },
        code = { icon = " ", color = "error" },
      },
      merge_keywords = false,
      highlight = {
        multiline = true,
        multiline_pattern = "^      .",
        -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty.
        keyword = "wide_fg",
        -- "fg" or "bg" or empty.
        before = "fg",
        after = "fg",
        comments_only = true,
      },
    },

    event = "VeryLazy",
    keys = {
      { "[t", m.jump_prev, mode = "n", desc = "Jump to next todo" },
      { "]t", m.jump_next, mode = "n", desc = "Jump to previous todo" },
    },
  },
}
