-- Fully featured & enhanced replacement for copilot.vim.

return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
    server = {
      type = "nodejs",
    },
    filetypes = {
      javascript = true,
      typescript = true,
      python = true,
      lua = true,
      ["*"] = false,
    },
  },
  event = "InsertEnter",
}
