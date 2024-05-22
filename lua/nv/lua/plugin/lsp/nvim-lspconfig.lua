local set = vim.keymap.key

local function default_capabilities()
  return require("cmp_nvim_lsp").default_capabilities()
end

local function opts_default()
  return {
    -- on_attach = on_attach,
    -- on_init = on_init,
    capabilities = default_capabilities(),
  }
end

local function opts_tsserver()
  return {
    -- on_attach = on_attach,
    -- on_init = on_init,
    capabilities = default_capabilities(),
  }
end

local function opts()
  return {
    filetypes = {
      lua = { lua_ls = opts_default },
      python = { pylsp = opts_default, jedi_language_server = opts_default, pyright = opts_default },
      typescript = { tsserver = opts_tsserver },
    },
  }
end

local function config(_, opts)
  local lspconfig = require "lspconfig"
  for filetype, configs in pairs(opts.filetypes) do
    for lsp_name, lsp_opts in pairs(configs) do
      lspconfig[lsp_name].setup(lsp_opts())
    end
  end
end

return {
  "neovim/nvim-lspconfig",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  event = "BufReadPost",
  config = config,
  opts = opts,
}
