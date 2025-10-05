-- An asynchronous linter plugin for Neovim complementary
-- to the built-in Language Server Protocol support.

return {
  "mfussenegger/nvim-lint",

  config = function()
    require("lint").linters_by_ft = {
      -- python = { "mypy" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,

  event = "VeryLazy",
}
