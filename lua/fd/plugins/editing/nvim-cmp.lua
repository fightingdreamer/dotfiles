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
    end
}

return {
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            "rafamadriz/friendly-snippets"
        },
        setup = function()
            require("luasnip.loaders.from_vscode").lazy_load({
                paths = {
                    "~/Library/Application Support/Code/User/snippets/vue.json"
                }
            })
        end,
    },
    {
        'hrsh7th/nvim-cmp',
        version = false,
        dependencies = {
            -- source
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp',
            -- snippet vim
            -- 'hrsh7th/cmp-vsnip',
            -- 'hrsh7th/vim-vsnip',
            -- snippet lua
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
        event = 'InsertEnter',
        config = function()
            local cmp = require('cmp')

            cmp.setup({
                snippet = {
                    expand = function(args)
                        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<Enter>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    {
                        name = 'buffer',
                        option = {
                            keyword_length = 3,
                            get_bufnrs = select_from.visible_buffers,
                        }
                    },
                    -- { name = 'vsnip' }, -- For vsnip users.
                    { name = 'luasnip' }, -- For luasnip users.
                }),
                sorting = {
                    comparators = {
                        cmp.config.compare.length,
                    }
                }
            })

            cmp.setup.cmdline({ ':' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'cmdline' }
                }
            })
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })
        end,
    },
}
