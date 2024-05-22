local select_from = {
  current_buffer = function()
    return { vim.api.nvim_get_current_buf() }
  end,
  visible_buffers = function()
    local bufs = {}
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      bufs[vim.api.nvim_win_get_buf(win)] = true
    end
    return vim.tbl_keys(bufs)
  end,
  all_buffers = function()
    return vim.api.nvim_list_bufs()
  end,
}

local function opts()
  local cmp = require "cmp"
  local config = cmp.config
  local mapping = cmp.mapping
  local luasnip = require "luasnip"

  return {
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    window = {
      completion = config.window.bordered(),
      documentation = config.window.bordered(),
    },
    mapping = mapping.preset.insert {
      ["<C-b>"] = mapping.scroll_docs(-4),
      ["<C-f>"] = mapping.scroll_docs(4),
      -- ["<S-Tab>"] = mapping.select_prev_item(),
      ["<S-Tab>"] = mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        elseif cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      -- ["<Tab>"] = mapping.select_next_item(),
      ["<Tab>"] = mapping(function(fallback)
        if luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.jumpable(1) then
          luasnip.jump(1)
        elseif cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<C-e>"] = mapping.abort(),
      ["<Enter>"] = mapping.confirm { select = true },
      ["<C-Space>"] = mapping.complete(),
    },
    sources = config.sources {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer", get_bufnrs = select_from.all_buffers },
      { name = "calc" },
    },
    sorting = {
      comparators = {
        -- link: https://github.com/hrsh7th/nvim-cmp/blob/5260e5e8ecadaf13e6b82cf867a909f54e15fd07/lua/cmp/config/compare.lua
        config.compare.score,
      },
    },
    performance = {
      debounce = 300,
      throttle = 100,
    },
    experimental = {
      ghost_text = true,
    },
  }
end

local function config(_, opts)
  local cmp = require "cmp"
  local config = cmp.config
  local mapping = cmp.mapping
  cmp.setup(opts)

  -- use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ "/", "?" }, {
    mapping = mapping.preset.cmdline(),
    sources = { { name = "buffer" } },
  })

  -- use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ ":" }, {
    mapping = mapping.preset.cmdline(),
    sources = config.sources({ { name = "path" } }, { { name = "cmdline" } }),
    matching = { disallow_symbol_nonprefix_matching = false },
  })
end

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- snippets
    "L3MON4D3/LuaSnip",
    -- sources
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-calc",
    -- navigate
    "abecodes/tabout.nvim",
  },
  config = config,
  event = { "CmdlineEnter", "InsertEnter" },
  opts = opts,
}
