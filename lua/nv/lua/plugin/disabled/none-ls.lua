-- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.

return {
  "nvimtools/none-ls.nvim",

  config = function()
    local null_ls = require "null-ls"
    null_ls.setup {
      sources = {
        -- null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.completion.spell,
        --
        -- >> ~/.config/mypy/config
        -- [mypy]
        -- python_executable = .venv/bin/python
        --
        -- >> ./pyproject.toml
        -- [tool.mypy]
        -- python_executable = ".venv/bin/python"
        --
        null_ls.builtins.diagnostics.mypy,
      },
    }
  end,

  event = "VeryLazy",
}
