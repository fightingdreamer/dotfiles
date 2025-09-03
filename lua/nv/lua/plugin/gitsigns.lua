-- Super fast git decorations implemented purely in Lua.

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
      untracked = { text = "┇" },
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
    { "\\g", "<cmd>Gitsigns toggle_current_line_blame<cr>", mode = { "n" }, desc = "Gitsigns toggle current line blame" },
  },
}
