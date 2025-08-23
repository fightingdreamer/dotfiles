local _config = function()
  local null_ls = require "null-ls"
  null_ls.setup {
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.completion.spell,
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
end

return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  event = "BufReadPost",
  config = _config,
  keys = {},
}
