-- Install and upgrade third party tools automatically.

return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",

  dependencies = {
    "mason-org/mason.nvim",
  },

  config = function(_, opts)
    local module = require "mason-tool-installer"
    module.setup(opts)
    module.check_install(false)
  end,
  opts = {
    run_on_start = false,
    ensure_installed = {
      { "shfmt",               auto_update = true },
      { "basedpyright",        auto_update = false },
      -- { "biome", auto_update = true }, -- need npm
      { "debugpy",             auto_update = true },
      { "lua-language-server", auto_update = true },
      -- { "sql-formatter",       auto_update = true }, -- need npm
      { "stylua",              auto_update = true },
      { "superhtml",           auto_update = true },
      { "ty",                  auto_update = true },
    },
    integrations = {
      ["mason-null-ls"] = false,
      ["mason-nvim-dap"] = false,
      ["mason-lspconfig"] = false,
    },
  },

  event = "VeryLazy",
}
