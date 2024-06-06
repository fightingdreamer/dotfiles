local opts = function()
  return {
    extensions = {
      import = {
        -- Add imports to the top of the file keeping the cursor in place
        insert_at_top = true,
        -- link: https://github.com/piersolenski/telescope-import.nvim/blob/main/lua/import/languages.lua
        custom_languages = {
          {
            -- Note the escaped \$ for fish shell
            regex = [[(?m)^(?:from[ ]+(\S+)[ ]+)?import[ ]+(\S+)[ ]*\$]],
            filetypes = { "python" },
            extensions = { "py" },
          },
        },
      },
    },
  }
end

local config = function(_, opts)
  require("telescope").setup(opts)
  require("telescope").load_extension "import"
end

local function telescope_import()
  local cword = vim.fn.expand "<cword>"
  return "<cmd>Telescope import<cr>" .. cword
end

return {
  "piersolenski/telescope-import.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = config,
  opts = opts,
  keys = {
    { "<leader>i", telescope_import, desc = "Telescope import", expr = true },
  },
}
