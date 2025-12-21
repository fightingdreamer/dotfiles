-- Lightweight yet powerful formatter plugin for Neovim.

-- taplo.toml
-- [formatting]
-- indent_string = "    "
-- column_width = 120

-- biome.json
-- {
--   "$schema": "./node_modules/@biomejs/biome/configuration_schema.json",
--   "formatter": {
--     "indentStyle": "space"
--   }
-- }

local m = {
  format = function()
    require("conform").format()
  end,
}

local c = {
  conform_disable = function(args)
    if args.bang then
      vim.b.conform_disabled = true
    else
      vim.g.conform_disabled = true
    end
  end,

  conform_enable = function(args)
    if args.bang then
      vim.b.conform_disabled = false
    else
      vim.g.conform_disabled = false
    end
  end,
}

return {
  "stevearc/conform.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },

  init = function()
    vim.api.nvim_create_user_command("ConformEnable", c.conform_enable, {
      desc = "Conform enable format-on-save",
      bang = true,
    })

    vim.api.nvim_create_user_command("ConformDisable", c.conform_disable, {
      desc = "Conform disable format-on-save",
      bang = true,
    })
  end,

  opts = {
    formatters = {
      jq_jsonl = {
        command = 'jq',
        args = { '-c', '.' },
      }
    },
    formatters_by_ft = {
      bash = { "shfmt" },
      fish = { "fish_indent" },
      graphql = {},
      javascript = { "biome-organize-imports", "biome" },
      json = { "jq" },
      jsonl = { "jq_jsonl" },
      lua = { "stylua" },
      nix = { "alejandra", "nixfmt" },
      python = { "ruff_fix", "ruff_organize_imports" },
      -- python = { "black", "isort" },
      sh = { "shfmt" },
      toml = { "taplo" },
      html = { "superhtml" },
      typescript = { "biome-organize-imports", "biome" },
      typescriptreact = { "biome-organize-imports", "biome" },
      vue = { "biome" },
      zig = { "zigfmt" },
      sql = { "sql_formatter" },
    },
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.conform_disabled or vim.b[bufnr].disable_autoformat then
        return
      end
      -- For Python files, prefer LSP formatting (ruff LSP)
      local filetype = vim.bo[bufnr].filetype
      if filetype == "python" then
        return { lsp_format = "first", timeout_ms = 5000 }
      end
      return { lsp_format = "prefer", timeout_ms = 5000 }
    end,
  },

  event = "VeryLazy",
  keys = {
    { "<leader>f", m.format, mode = { "n", "v" }, desc = "Conform format" },
  },
}
