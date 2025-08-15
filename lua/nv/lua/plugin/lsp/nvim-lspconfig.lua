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

local function get_lua_ls()
  return {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" }, -- Ignore "undefined global vim" warnings
        },
        workspace = {
          library = {
            vim.env.VIMRUNTIME, -- Neovim runtime files
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
        linters = {
          SpellCheck = false,
          SpelledNumbers = false,
          AnA = true,
          SentenceCapitalization = true,
          UnclosedQuotes = true,
          WrongQuotes = false,
          LongSentences = true,
          RepeatedWords = true,
          Spaces = true,
          Matcher = true,
          CorrectNumberSuffix = true,
        },
        dialect = "American",
      },
    },
  }
end

local function get_servers()
  -- :help lspconfig-all
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
    ty = {},
    ruff = get_ruff(),
    -- basedpyright = get_basedpyright(),

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
    -- :help lspconfig-all
    for server, config in pairs(opts.servers) do
      config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
      pcall(vim.lsp.config, server, config)
      vim.lsp.enable(server)
    end
  end,
}
