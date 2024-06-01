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

local function opts_jedi()
  return {
    on_attach = function(client)
      client.server_capabilities.declarationProvider = false
      client.server_capabilities.definitionProvider = false
      client.server_capabilities.typeDefinitionProvider = false
      client.server_capabilities.referencesProvider = false
      client.server_capabilities.workspaceSymbol = false
      client.server_capabilities.workspaceSymbolProvider = false
    end,
    -- on_init = on_init,
    capabilities = default_capabilities(),
  }
end

local function opts_pylsp()
  return {
    on_attach = function(client)
      client.server_capabilities.declarationProvider = false
      client.server_capabilities.definitionProvider = false
      client.server_capabilities.typeDefinitionProvider = false
      client.server_capabilities.referencesProvider = false
      client.server_capabilities.workspaceSymbol = false
      client.server_capabilities.workspaceSymbolProvider = false
    end,
    -- on_init = on_init,
    capabilities = default_capabilities(),
    settings = {
      pylsp = {
        plugins = {
          ruff = {
            -- python project (have: pyproject.toml or ruff.toml)
            enabled = true,
            formatEnabled = true,
            extendSelect = {},
            extendIgnore = {},
            format = {},
            -- python file
            lineLength = 120,
            select = { "F" },
            ignore = { "D210" },
          },
          autopep8 = {
            enabled = false,
          },
          pycodestyle = {
            enabled = false,
          },
          pyflakes = {
            enabled = false,
          },
          yapf = {
            enabled = false,
          },
          jedi_completion = {
            eager = false,
            enabled = false,
          },
          rope_autoimport = {
            memory = true,
            enabled = true,
          },
          rope_completion = {
            eager = true,
            enabled = true,
          },
        },
      },
    },
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
      python = { pylsp = opts_pylsp, jedi_language_server = opts_jedi, pyright = opts_default },
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
