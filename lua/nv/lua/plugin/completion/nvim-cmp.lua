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

local function max_width()
  return math.floor(0.45 * vim.o.columns)
end

local function opts()
  local cmp = require "cmp"
  local luasnip = require "luasnip"
  local lspkind = require "lspkind"

  return {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert {
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      -- ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        elseif cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      -- ["<Tab>"] = cmp.mapping.select_next_item(),
      ["<Tab>"] = cmp.mapping(function(fallback)
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
      ["<C-e>"] = cmp.mapping.abort(),
      ["<Enter>"] = cmp.mapping.confirm { select = true },
      ["<C-Space>"] = cmp.mapping.complete(),
    },
    sources = cmp.config.sources {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer", get_bufnrs = select_from.all_buffers },
      { name = "calc" },
    },
    sorting = {
      comparators = {
        -- link: https://github.com/hrsh7th/nvim-cmp/blob/5260e5e8ecadaf13e6b82cf867a909f54e15fd07/lua/cmp/config/compare.lua
        cmp.config.compare.score,
      },
    },
    formatting = {
      format = lspkind.cmp_format {
        mode = "symbol_text",
        preset = "default",
        maxwidth = max_width,
        ellipsis_char = "...",
        show_labelDetails = true,
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
  cmp.setup(opts)

  -- use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = "buffer" } },
  })

  -- use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ ":" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
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
    -- fancy icons
    "onsails/lspkind.nvim",
  },
  config = config,
  event = { "CmdlineEnter", "InsertEnter" },
  opts = opts,
}
