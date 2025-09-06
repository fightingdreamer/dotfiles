-- Super fast git decorations implemented purely in Lua.

local m = {
  prev_hunk = function()
    require("gitsigns").nav_hunk "prev"
  end,
  next_hunk = function()
    require("gitsigns").nav_hunk "next"
  end,
  reset_hunk = function()
    local gitsigns = require "gitsigns"
    if vim.fn.mode() == "n" then
      gitsigns.reset_hunk()
    end
    if vim.fn.mode() == "V" then
      gitsigns.reset_hunk {
        vim.fn.line ".",
        vim.fn.line "v",
      }
    end
  end,
  stage_hunk = function()
    local gitsigns = require "gitsigns"
    if vim.fn.mode() == "n" then
      gitsigns.stage_hunk()
    end
    if vim.fn.mode() == "V" then
      gitsigns.stage_hunk {
        vim.fn.line ".",
        vim.fn.line "v",
      }
    end
  end,
  blame = function()
    require("gitsigns").blame()
  end,
  toggle_current_line_blame = function()
    require("gitsigns").toggle_current_line_blame()
  end,
}

return {
  "lewis6991/gitsigns.nvim",
  opts = {
    -- │┆┃┇_‾~
    signs = {
      add = { text = "┃" },
      change = { text = "┃" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┆" },
    },
    signs_staged = {
      add = { text = "┃" },
      change = { text = "┃" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┆" },
    },
    diff_opts = {
      internal = true,
      algorithm = "histogram",
      linematch = 1,
    },
    watch_gitdir = {
      enable = true,
      follow_files = true,
    },
    current_line_blame = false,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 100,
      virt_text_priority = 10,
    },

    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function opts(desc)
        return { buffer = bufnr, desc = desc }
      end
    end,
  },

  event = "VeryLazy",
  keys = {
    { "[h", m.prev_hunk, mode = { "n" }, desc = "Navigate to previous hunk" },
    { "]h", m.next_hunk, mode = { "n" }, desc = "Navigate to next hunk" },
    { "gr", m.reset_hunk, mode = { "n", "v" }, desc = "Reset hunk" },
    { "gs", m.stage_hunk, mode = { "n", "v" }, desc = "Stage hunk" },
    { "gB", m.blame, mode = { "n" }, desc = "Toggle git blame" },
    { "\\b", m.toggle_current_line_blame, mode = { "n" }, desc = "Gitsigns toggle current line blame" },
  },
}
