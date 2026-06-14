-- Show nvim diagnostics using virtual lines.

local m = {
  toggle = function()
    require("lsp_lines").toggle()
  end,
}

return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",

  -- (alignment is off) https://todo.sr.ht/~whynothugo/lsp_lines.nvim/52
  -- commit = "6f3defec73f7c87939e800e9afa5d0571b19b401",

  init = function()
    vim.diagnostic.config { virtual_lines = false }
  end,

  event = "VeryLazy",
  keys = {
    { "\\l", m.toggle, desc = "lsp_lines: toggle inline" },
  },
}
