local function buf_size(buf)
  return vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
end

local function smaller_then(max_size, get_bufnrs)
  local callback = function()
    local bufs = get_bufnrs()
    local result = {}
    for _, buf in ipairs(bufs) do
      if buf_size(buf) < max_size then
        result[buf] = true
      end
    end
    return vim.tbl_keys(result)
  end
  return callback
end

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

local function entry_filter_vue(entry, ctx)
  local char = ctx.cursor_before_line:sub(-1)
  if char == "@" then
    return entry.completion_item.label:match "^@"
  end
  if char == ":" then
    return entry.completion_item.label:match "^:" and not entry.completion_item.label:match "^:on-"
  end
  return true
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
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),

      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<C-e>"] = cmp.mapping.abort(),
      ["<Enter>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },

      ["<C-l>"] = cmp.mapping(function(fallback)
        if luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.jumpable(1) then
          luasnip.jump(1)
        elseif cmp.visible() then
          cmp.confirm { select = true }
        else
          cmp.complete()
        end
      end, { "i", "s" }),

      ["<C-L>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    sources = cmp.config.sources {
      {
        name = "nvim_lsp",
        -- entry_filter = function(entry, ctx)
        --   if ctx.filetype == "vue" then
        --     return entry_filter_vue(entry, ctx)
        --   end
        --   return true
        -- end,
      },
      { name = "luasnip" },
      { name = "orgmode" },
      { name = "buffer", option = { get_bufnrs = smaller_then(3145728, select_from.all_buffers) } },
      { name = "calc" },
    },
    matching = {
      disallow_fuzzy_matching = false,
      disallow_fullfuzzy_matching = true,
      disallow_partial_fuzzy_matching = true,
      disallow_partial_matching = false,
      disallow_prefix_unmatching = true,
      disallow_symbol_nonprefix_matching = true,
    },
    sorting = {
      comparators = {
        -- link: https://github.com/hrsh7th/nvim-cmp/blob/5260e5e8ecadaf13e6b82cf867a909f54e15fd07/lua/cmp/config/compare.lua
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.offset,
        cmp.config.compare.recently_used,
        cmp.config.compare.locality,
        cmp.config.compare.kind,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    },
    formatting = {
      format = lspkind.cmp_format {
        mode = "symbol_text",
        preset = "default",
        maxwidth = max_width,
        ellipsis_char = "→",
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
