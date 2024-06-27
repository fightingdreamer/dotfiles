local function opts()
  return {
    keys = {
      -- ["<cr>"] = false,
      ["<tab>"] = "jump",
      -- ["<2-leftmouse>"] = false,
    },
    modes = {
      lsp = {
        win = {
          size = 0.5,
          relative = "win",
          position = "right",
        },
      },
      symbols = {
        win = {
          size = 0.5,
          relative = "win",
          position = "right",
        },
      },
    },
  }
end

local function config(_, opts)
  require("trouble").setup(opts)
end

return {
  -- A pretty diagnostics, references, telescope results, quickfix and location list.
  "folke/trouble.nvim",
  config = config,
  keys = {
    { "\\t", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "trouble: buffer diagnostics" },
    { "\\T", "<cmd>Trouble diagnostics toggle<cr>", desc = "trouble: diagnostics" },
    { "\\s", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "trouble: Symbols" },
    { "\\l", "<cmd>Trouble lsp toggle focus=false<cr>", desc = "trouble: lsp diagnostics" },
  },
  opts = opts,
  cmd = "Trouble",
}
