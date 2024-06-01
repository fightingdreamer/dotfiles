local function opts()
  return {}
end

local function config(_, opts)
  require("trouble").setup(opts)
end

return {
  "folke/trouble.nvim",
  config = config,
  keys = {
    { "\\t", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "trouble: buffer diagnostics" },
    { "\\T", "<cmd>Trouble diagnostics toggle<cr>", desc = "trouble: diagnostics" },
    { "\\s", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "trouble: Symbols" },
    { "\\l", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "trouble: lsp diagnostics" },
  },
  opts = opts,
  cmd = "Trouble",
}
