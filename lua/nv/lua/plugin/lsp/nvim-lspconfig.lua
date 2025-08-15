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

local function get_lazy_plugin_paths()
  local lazy_path = vim.fn.stdpath "data" .. "/lazy"
  local plugins = {}
  -- Check if Lazy.nvim is installed.
  if vim.loop.fs_stat(lazy_path) then
    -- Scan all directories in `lazy/` (assuming they are plugins).
    for name, _ in vim.fs.dir(lazy_path) do
      local plugin_lua_path = lazy_path .. "/" .. name .. "/lua"
      if vim.loop.fs_stat(plugin_lua_path) then
        table.insert(plugins, plugin_lua_path)
      end
    end
  end
  return plugins
end

local lazy_plugin_paths = nil

local function get_cached_lazy_paths()
  if not lazy_plugin_paths then
    lazy_plugin_paths = get_lazy_plugin_paths()
  end
  return lazy_plugin_paths
end

local function get_lua_ls()
  return {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" }, -- Ignore "undefined global vim" warnings
        },
        workspace = {
          library = vim.tbl_flatten {
            vim.env.VIMRUNTIME, -- Neovim runtime files
            get_cached_lazy_paths(),
          },
          checkThirdParty = false, -- Disable "missing third-party library" warnings
        },
        telemetry = { enable = false }, -- Disable telemetry
        completion = {
          callSnippet = "Replace", -- Auto-fill function arguments
        },
        hint = {
          enable = true, -- Show type hints
        },
      },
    },
  }
end

local function get_ts_ls()
  return {
    filetypes = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "vue",
    },
  }
end

local function get_ruff()
  return {
    on_attach = function(client)
      if client.name == "ruff" then
        client.server_capabilities.hoverProvider = false
      end
    end,
  }
end

local function get_basedpyright()
  return {
    -- link: https://github.com/microsoft/pyright/blob/main/docs/settings.md
    settings = {
      basedpyright = {
        disableOrganizeImports = true,
        analysis = {
          -- Diagnostic mode `workspace` or `openFilesOnly`.
          diagnosticMode = "workspace",
          inlayHints = {
            -- Conflicts with ty.
            variableTypes = true,
            -- Conflicts with ty.
            callArgumentNames = true,
            functionReturnTypes = true,
            -- Conflicts with ty.
            genericTypes = true,
          },
        },
      },
    },
  }
end

local function get_harper_ls()
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

local function get_servers()
  return {
    -- C and C++
    clangd = {},

    -- Lua.
    lua_ls = get_lua_ls(),

    -- Xml.
    lemminx = {},

    -- Vue.
    -- vue_ls = {},

    -- Css.
    tailwindcss = {},
    unocss = {},
    cssls = {},

    -- Javascript and Typescript.
    ts_ls = get_ts_ls(),

    -- Html.
    html = {},
    superhtml = {},

    -- Python.
    -- ty = {},
    ruff = get_ruff(),
    basedpyright = get_basedpyright(),

    -- Yaml.
    yamlls = {},

    -- Zig.
    zls = {},

    -- Sql.
    sqls = {},
    sqlls = {},

    -- Go.
    gopls = {},

    -- Spelling.
    harper_ls = get_harper_ls(),
  }
end

local function get_opts()
  return {
    servers = get_servers(),
  }
end

return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },
  event = "BufReadPre",
  opts = get_opts(),
  config = function(_, opts)
    local lspconfig = require "lspconfig"
    for server, config in pairs(opts.servers) do
      config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
  end,
}
