local handle_any = function(server_name)
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    local capabilities = cmp_nvim_lsp.default_capabilities()
    lspconfig[server_name].setup {
        capabilities = capabilities,
    }
end

local handle_jedi_language_server = function()
    local lspconfig = require("lspconfig")
    lspconfig.jedi_language_server.setup {
        filetypes = {
            'python',
        },
        on_attach = function(client)
            client.server_capabilities.workspaceSymbolProvider = true
            client.server_capabilities.renameProvider = false
        end
    }
end


local handle_pylsp = function()
    local lspconfig = require("lspconfig")
    lspconfig.pylsp.setup {
        settings = {
            pylsp = {
                plugins = {
                    autopep8 = {
                        enabled = false,
                    },
                    pycodestyle = {
                        enabled = false,
                    },
                    pyflakes = {
                        enabled = false,
                    },
                    yapf = {
                        enabled = false,
                    },
                    jedi_completion = {
                        eager = false,
                        enabled = false,
                    },
                    rope_autoimport = {
                        memory = true,
                        enabled = true,
                    },
                    rope_completion = {
                        eager = true,
                        enabled = true,
                    },
                },
            },
        },
        filetypes = {
            'python',
        },
        on_attach = function(client)
            client.server_capabilities.workspaceSymbolProvider = false
            client.server_capabilities.renameProvider = false
        end
        -- cmd = { "pylsp", "-v", "--log-file", "/tmp/nvim-pylsp.log" },
    }
end

local handle_volar = function()
    local lspconfig = require("lspconfig")
    lspconfig.volar.setup {
        filetypes = {
            'vue',
            'javascript',
            'typescript',
        },
        on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        end
    }
end

local handle_lua_ls = function()
    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup {
        settings = {
            Lua = {
                diagnostics = {
                    -- globals = { "vim" }
                },
                completion = {
                    -- needed for neodev.nvim
                    callSnippet = "Replace"
                }
            }
        }
    }
end

local handle_pyright = function()
    local lspconfig = require("lspconfig")
    lspconfig.pyright.setup {
        on_attach = function(client)
            client.server_capabilities.workspaceSymbolProvider = false
            client.server_capabilities.renameProvider = true
        end
    }
end

local handle_tsserver = function()
    local lspconfig = require("lspconfig")
    lspconfig.tsserver.setup {
        filetypes = { "typescriptreact", "typescript.tsx" },
    }
end

local handle_tailwindcss = function()
    local lspconfig = require("lspconfig")
    lspconfig.tailwindcss.setup {
        -- filetypes = { "css", "html", "typescriptreact", "typescript.tsx" },
        filetypes = { "vue", "css", "html", "typescriptreact", "typescript.tsx" },
    }
end

local handle_efm = function()
    -- note: efm should be only used when none-ls/null-ls,
    --       does not have config for needed tool

    -- link: https://github.com/creativenull/efmls-configs-nvim/blob/main/doc/SUPPORTED_LIST.md

    -- linters
    -- fish
    -- local fish = require('efmls-configs.linters.fish')

    -- formatters
    -- fish
    -- local fish_indent = require('efmls-configs.formatters.fish_indent')

    local languages = {
        -- fish = { fish, fish_indent },
    }

    local lspconfig = require("lspconfig")
    lspconfig.efm.setup {
        -- cmd = {
        --     '/Users/patryk/.local/share/nvim/mason/bin/efm-langserver',
        --     '-logfile', '/tmp/efm.log', '-loglevel', '5',
        -- },
        init_options = {
            documentFormatting = true,
            documentRangeFormatting = true,
            -- hover = true,
            -- documentSymbol = true,
            -- codeAction = true,
            -- completion = true
        },
        settings = {
            rootMarkers = { ".git/" },
            filetypes = vim.tbl_keys(languages),
            languages = languages,
        },
        on_attach = function(client)
            client.server_capabilities.workspaceSymbolProvider = false
        end
    }
end

return {
    {
        'williamboman/mason.nvim',
        opts = {
            ui = {
                keymaps = {
                    -- global toggles
                    toggle_package_expand = "<Tab>",
                    toggle_package_install_log = "<Tab>",
                    toggle_help = "g?",
                    -- single package related
                    install_package = "i",
                    update_package = "u",
                    check_package_version = "c",
                    uninstall_package = "x",
                    -- global package related
                    update_all_packages = "U",
                    check_outdated_packages = "C",
                    cancel_installation = "<C-c>",
                    apply_language_filter = "<C-f>",
                },
            }
        }
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'williamboman/mason.nvim',
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'creativenull/efmls-configs-nvim',
        },
        opts = {
            -- only LSPs
            ensure_installed = {
                -- 'efm',
                'pylsp', -- after mason 2.0, add python-lsp-rope and pylsp-ruff
                -- 'biome',
                'volar',
                'svelte',
                'jsonls',
                'lua_ls',
                'pyright',
                'graphql',
                'tsserver',
                -- 'tailwindcss',          -- add master css lsp
                'jedi_language_server', -- better global symbols order than pyright
                -- 'ruff_lsp',
            },
            handlers = {
                handle_any,
                -- ['efm'] = handle_efm,
                ['pylsp'] = handle_pylsp,
                ['volar'] = handle_volar,
                ['lua_ls'] = handle_lua_ls,
                ['pyright'] = handle_pyright,
                ['tsserver'] = handle_tsserver,
                -- ['tailwindcss'] = handle_tailwindcss,
                ['jedi_language_server'] = handle_jedi_language_server
            }
        },
    },
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
        },
        event = 'VeryLazy',
        opts = {
            -- only Linters, Formatters
            ensure_installed = {
                'ruff',
                'ruff-lsp',
                'isort',
                'shfmt',
                'taplo',
                'css-lsp',
                -- 'eslint_d',
                'prettierd',
                'harper-ls',  -- grammary
                'clangd',  -- c++
            }
        }
    }
}
