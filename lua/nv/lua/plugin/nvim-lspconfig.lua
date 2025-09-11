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

local c = {
  lua_ls = {
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
  },

  ts_ls = {
    filetypes = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "vue",
    },
  },

  ruff = {
    on_attach = function(client)
      if client.name == "ruff" then
        client.server_capabilities.hoverProvider = false
      end
    end,
  },

  pyrefly = {
    settings = {
      python = {
        pyrefly = {
          displayTypeErrors = "force-on",
        },
      },
    },
  },

  basedpyright = {
    -- link: https://github.com/microsoft/pyright/blob/main/docs/settings.md
    settings = {
      basedpyright = {
        -- This option is useful if you want to use basedpyright only
        -- as a type checker, but want to run another Python language
        -- server for language service features.
        disableLanguageServices = false,
        -- If you are using another extension that provides similar,
        -- functionality and you don’t want the two extensions to
        -- fight each other.
        autoFormatStrings = true,
        useTypingExtensions = false,
        disableOrganizeImports = true,
        fileEnumerationTimeout = 1,
        analysis = {
          -- Diagnostic mode `workspace` or `openFilesOnly`.
          diagnosticMode = "workspace",
          autoImportCompletions = true,
          useLibraryCodeForTypes = true,
          inlayHints = {
            -- Conflicts with ty.
            variableTypes = true,
            -- Conflicts with ty.
            callArgumentNames = true,
            callArgumentNamesMatching = false,
            functionReturnTypes = true,
            -- Conflicts with ty.
            genericTypes = true,
          },
        },
      },
    },
  },

  harper_ls = {
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
  },
}

return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },

  opts = {
    servers = {
      -- C and C++
      clangd = {},

      -- Lua.
      lua_ls = c.lua_ls,

      -- Xml.
      lemminx = {},

      -- Vue.
      -- vue_ls = {},

      -- Css.
      tailwindcss = {},
      unocss = {},
      cssls = {},

      -- Javascript and Typescript.
      biome = {},
      eslint = {},
      ts_ls = c.ts_ls,

      -- Html.
      html = {},
      superhtml = {},

      -- Python.
      -- ty = {},
      ruff = c.ruff,
      -- pyrefly = c.pyrefly,
      basedpyright = c.basedpyright,

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
      harper_ls = c.harper_ls,
    },
  },
  config = function(_, opts)
    -- :help lspconfig-all
    for server, config in pairs(opts.servers) do
      config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
      pcall(vim.lsp.config, server, config)
      vim.lsp.enable(server)
    end
  end,

  event = "VeryLazy",
}
