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
      client.server_capabilities.documentSymbolProvider = false
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
      client.server_capabilities.documentSymbolProvider = false
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
            enabled = false,
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
          pylsp_rope = {
            enabled = false,
            rename = false,
          },
          yapf = {
            enabled = false,
          },
          jedi_completion = {
            eager = false,
            enabled = false,
          },
          rope_autoimport = {
            memory = false,
            enabled = true,
            completions = {
              enabled = true,
            },
            code_actions = {
              enabled = true,
            },
          },
          rope_completion = {
            eager = false,
            enabled = true,
          },
        },
      },
    },
  }
end

local function opts_volar()
  return {
    filetypes = {
      "vue",
    },
    -- on_attach = on_attach,
    -- on_init = on_init,
    capabilities = default_capabilities(),
  }
end

local function opts_tsserver()
  local mason_registry = require "mason-registry"
  local root_path = mason_registry.get_package("vue-language-server"):get_install_path()
  local vue_lsp_path = root_path .. "/node_modules/@vue/language-server"
  return {
    filetypes = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "vue",
    },
    -- on_attach = on_attach,
    -- on_init = on_init,
    capabilities = default_capabilities(),
    init_options = {
      plugins = {
        {
          name = "@vue/typescript-plugin",
          location = vue_lsp_path,
          languages = { "vue" },
        },
      },
    },
  }
end

local function opts()
  return {
    configs = {
      -- c, cpp
      clangd = opts_default,
      -- lua
      lua_ls = opts_default,
      -- xml
      lemminx = opts_default,
      -- vue
      volar = opts_volar,
      -- js, ts
      tsserver = opts_tsserver,
      -- py
      pylsp = opts_pylsp,
      -- jedi_language_server = opts_jedi,
      pyright = opts_default,
      ruff = opts_default,
      -- zig
      zls = opts_default,
    },
  }
end

local function config(_, opts)
  local lspconfig = require "lspconfig"
  for lsp_name, config in pairs(opts.configs) do
    lspconfig[lsp_name].setup(config())
  end
end

return {
  "neovim/nvim-lspconfig",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  event = "BufReadPost",
  config = config,
  opts = opts,
}
