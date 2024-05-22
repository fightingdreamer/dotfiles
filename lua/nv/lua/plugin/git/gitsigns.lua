local map = vim.keymap.set

local opts = function()
  return {
    -- │┆┃┇_‾~
    signs = {
      add = { text = "┃" },
      change = { text = "┃" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┇" },
    },

    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function opts(desc)
        return { buffer = bufnr, desc = desc }
      end

      -- map("n", "<leader>rh", gs.reset_hunk, opts "Reset Hunk")
      -- map("n", "<leader>ph", gs.preview_hunk, opts "Preview Hunk")
      -- map("n", "<leader>gb", gs.blame_line, opts "Blame Line")
    end,
  }
end

local config = function(_, opts)
  require("gitsigns").setup(opts)
end

return {
  -- Super fast git decorations implemented purely in Lua.
  "lewis6991/gitsigns.nvim",
  config = config,
  event = "BufReadPost",
  opts = opts,
}
