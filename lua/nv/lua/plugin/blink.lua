-- Performant, batteries-included completion plugin for Neovim.

return {
  "saghen/blink.cmp",

  dependencies = {
    "folke/lazydev.nvim",
    "rafamadriz/friendly-snippets",
  },

  version = "1.*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "none",

      ["<Down>"] = { "select_next", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },

      ["<Tab>"] = { "select_and_accept", "fallback" },
      ["<C-space>"] = { "show" },
    },

    appearance = {
      nerd_font_variant = "mono",
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = {
      keyword = {
        -- Can be prefix or full.
        range = "prefix",
      },
      documentation = { auto_show = false },
      ghost_text = { enabled = true },
      accept = {
        auto_brackets = {
          enabled = false,
        },
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = true,
        },
      },
      menu = {
        draw = {
          columns = {
            { "label" },
            { "kind_icon",        gap = 1, "kind" },
            { "label_description" },
          },
          padding = { 0, 0 },
          components = {
            label_description = {
              width = { fill = true, max = 80 },
            },
          },
        },
      },
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = {
        "lazydev",
        "lsp",
        "path",
        "snippets",
        "buffer",
      },
      providers = {
        snippets = {
          min_keyword_length = 2,
          score_offset = 0,
        },
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 0,
        },
        lsp = {
          min_keyword_length = 0,
          score_offset = 0,
          async = true,
          fallbacks = {},
          transform_items = function(_, items)
            local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
            return vim.tbl_filter(function(item)
              return item.kind ~= CompletionItemKind.Keyword and item.kind ~= CompletionItemKind.Text
            end, items)
          end,
        },
        path = {
          min_keyword_length = 1,
          score_offset = 0,
        },
        buffer = {
          min_keyword_length = 1,
          score_offset = 0,
        },
      },
    },

    signature = { enabled = true },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = {
      sorts = {
        "exact",
        "score",
        "label",
        "sort_text",
      },
      implementation = "prefer_rust_with_warning",
      max_typos = 0,
      frecency = {
        enabled = false,
      },
      use_proximity = true,
    },
  },

  event = "VeryLazy",
}
