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
    keymap = { preset = "super-tab" },

    appearance = {
      nerd_font_variant = "mono",
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = {
      keyword = {
        -- Can be prefix or pull.
        range = "prefix",
      },
      documentation = { auto_show = false },
      ghost_text = { enabled = true },
      menu = {
        draw = {
          columns = {
            { "label" },
            { "kind_icon", gap = 1, "kind" },
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
          score_offset = 4,
        },
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
        lsp = {
          min_keyword_length = 0,
          score_offset = 3,
          async = false,
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
          score_offset = 2,
        },
        buffer = {
          min_keyword_length = 1,
          score_offset = 1,
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
    },
  },

  event = "VeryLazy",
}
