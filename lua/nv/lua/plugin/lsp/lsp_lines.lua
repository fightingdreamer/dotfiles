local function config(_, opts)
  require("lsp_lines").setup()
  vim.diagnostic.config {
    virtual_lines = false,
  }
end

local function toggle()
  require("lsp_lines").toggle()
end

return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  commit = "6f3defec73f7c87939e800e9afa5d0571b19b401",
  event = "BufReadPost",
  config = config,
  keys = {
    { "\\l", toggle, desc = "lsp_lines: toggle inline" },
  },
}
