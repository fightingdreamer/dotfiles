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

local function opts_pyright()
  return {
    -- on_attach = function(client, bufnr) end,
    -- on_init = on_init,
    capabilities = default_capabilities(),
    -- link: https://github.com/microsoft/pyright/blob/main/docs/settings.md
    settings = {
      pyright = {
        autoImportCompletion = true,
        disableOrganizeImports = true,
      },
      python = {
        pythonPath = vim.fn.exepath "python3",
        analysis = {
          diagnosticMode = "openFilesOnly",
          -- diagnosticMode = "workspace",
          -- typeCheckingMode = "standard",
          useLibraryCodeForTypes = true,
        },
      },
    },
  }
end

local function opts_basedpyright()
  return {
    -- on_attach = function(client, bufnr) end,
    -- on_init = on_init,
    capabilities = default_capabilities(),
    -- link: https://github.com/microsoft/pyright/blob/main/docs/settings.md
    settings = {
      basedpyright = {
        disableOrganizeImports = true,
        analysis = {
          -- diagnosticMode = "openFilesOnly",
          diagnosticMode = "workspace",
          inlayHints = {
            variableTypes = true, -- conflicts with ty
            callArgumentNames = true, -- conflicts with ty
            functionReturnTypes = true,
            genericTypes = true, -- conflicts with ty
          },
        },
      },
    },
  }
end

local function opts_ruff()
  return {
    on_attach = function(client, bufnr)
      if client.name == "ruff" then
        client.server_capabilities.hoverProvider = false
      end
    end,
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

local function opts_ts_ls()
  local mason_registry = require "mason-registry"
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
  }
end

local function opts_harper()
  return {
    settings = {
      ["harper-ls"] = {
        codeActions = {
          forceStable = true,
        },
      },
    },
  }
end

local function opts_djlsp()
  return {
    filetypes = {
      "html",
      "htmldjango",
    },
    init_options = {
      -- django_settings_module = "<your.settings.module>",
      -- docker_compose_file = "docker-compose.yml",
      docker_compose_service = "django",
    },
  }
end

local function opts_html()
  return {
    filetypes = {
      "html",
      "htmldjango",
    },
    capabilities = default_capabilities(),
  }
end

local function opts_superhtml()
  return {
    pattern = {
      "html",
    },
    capabilities = default_capabilities(),
  }
end

-- pyrightconfig.json
-- {
--   "include": [
--     "src"
--   ],
--   "pythonVersion": "3.12",
--   "reportAny": false,
--   "reportArgumentType": true,
--   "reportMissingParameterType": true,
--   "reportMissingTypeArgument": true,
--   "reportMissingTypeStubs": false,
--   "reportUnknownArgumentType": false,
--   "reportUnknownMemberType": false,
--   "reportUnknownParameterType": false,
--   "reportUnknownVariableType": false
-- }

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
      vue_ls = opts_default,
      -- js, ts
      -- css
      tailwindcss = opts_default(),
      unocss = opts_default(),
      ts_ls = opts_ts_ls,
      -- html
      -- djlsp = opts_djlsp,
      cssls = opts_default,
      html = opts_html,
      superhtml = opts_superhtml,
      -- py
      -- pylsp = opts_pylsp,
      -- jedi_language_server = opts_jedi,
      basedpyright = opts_basedpyright,
      -- pyright = opts_pyright,
      -- ty = opts_default,
      ruff = opts_ruff,
      yamlls = opts_default,
      -- zig
      zls = opts_default,
      sqls = opts_default,
      sqlls = opts_default,
      gopls = opts_default,
      -- spelling
      -- harper_ls = opts_harper,
      -- svelte = opts_default,
    },
  }
end

local function config(_, opts)
  local lspconfig = require "lspconfig"
  for lsp_name, lsp_config in pairs(opts.configs) do
    -- vim.lsp.config(lsp_name, lsp_config())
    vim.lsp.enable(lsp_name)
  end
end

return {
  "neovim/nvim-lspconfig",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  event = "BufReadPost",
  config = config,
  opts = opts,
}
