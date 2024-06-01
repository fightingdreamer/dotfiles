local function opts()
  return {}
end

local function config(_, opts)
  require("trouble").setup(opts)
end

return {
  "folke/trouble.nvim",
  config = config,
  branch = "dev", -- 3.0 beta
  keys = {
    { "<leader><leader>t", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "trouble: buffer diagnostics" },
    { "<leader><leader>T", "<cmd>Trouble diagnostics toggle<cr>", desc = "trouble: diagnostics" },
    { "<leader><leader>s", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "trouble: Symbols" },
    { "<leader><leader>l", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "trouble: lsp diagnostics" },
  },
  opts = opts,
  cmd = "Trouble",
}
