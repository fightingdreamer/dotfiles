local opts = function()
  return {
    formatters_by_ft = {
      bash = { "shfmt" },
      fish = { "fish_indent" },
      graphql = {},
      javascript = { "biome" },
      json = { "jq" },
      lua = { "stylua" },
      nix = { "alejandra", "nixfmt" },
      python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
      sh = { "shfmt" },
      toml = { "taplo" },
      typescript = { "biome" },
      typescriptreact = { "biome" },
      vue = { "biome" },
      zig = { "zigfmt" },
      sql = { "sql_formatter" },
    },
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.conform_disabled or vim.b[bufnr].disable_autoformat then
        return
      end
      return { lsp_format = "fallback" }
    end,
  }
end

local config = function(_, opts)
  require("conform").setup(opts)
end

local conform_format = function()
  require("conform").format { lsp_format = "fallback" }
end

local conform_disable = function(args)
  -- ConformDisable! will disable formatting just for this buffer
  if args.bang then
    vim.b.conform_disabled = true
  else
    vim.g.conform_disabled = true
  end
end

local conform_enable = function()
  vim.b.conform_disabled = false
  vim.g.conform_disabled = false
end

vim.api.nvim_create_user_command("ConformDisable", conform_disable, {
  desc = "Conform disable format-on-save",
  bang = true,
})

vim.api.nvim_create_user_command("ConformEnable", conform_enable, {
  desc = "Conform enable format-on-save",
})

return {
  -- Lightweight yet powerful formatter plugin for Neovim.
  "stevearc/conform.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = config,
  event = {
    "FileReadPost",
    -- 'BufReadPost',
    "BufWritePre",
    -- 'BufModifiedSet',
  },
  keys = {
    { "<leader>f", conform_format, mode = { "n", "v" }, desc = "Conform format" },
  },
  opts = opts,
}
