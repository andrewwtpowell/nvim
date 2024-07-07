return {

    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',

    dependencies = {
        --- Uncomment these if you want to manage the language servers from neovim
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- LSP Support
        {'neovim/nvim-lspconfig'},
        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'L3MON4D3/LuaSnip'},
        {'hrsh7th/cmp-buffer'},
    },

    config = function ()
        local lsp = require('lsp-zero')

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({buffer = bufnr})

            vim.keymap.set('n','gr', '<cmd>Telescope lsp_references<cr>', {buffer = bufnr})
            vim.keymap.set('n','gq', function ()
                vim.lsp.buf.format({async=false, timeout_ms=10000})
            end, {buffer = bufnr})
        end)

        lsp.preset('recommended')

        lsp.set_sign_icons({
            error = '✘',
            warn = '▲',
            hint = '⚑',
            info = '»'
        })

        require('mason').setup({
            log_level = vim.log.levels.DEBUG
        })
        require('mason-lspconfig').setup({
            ensure_installed = {
                'lua_ls',
                'clangd',
                'rust_analyzer',
                'gopls',
            },
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,

                lua_ls = function ()
                    require('lspconfig').lua_ls.setup({
                        lsp.nvim_lua_ls(),
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = {"vim"}
                                }
                            }
                        }
                    })
                end,

                rust_analyzer = function ()
                    require('lspconfig').rust_analyzer.setup({ })
                end,

                clangd = function ()
                    require('lspconfig').clangd.setup({ })
                end,

                gopls = function ()
                    require('lspconfig').gopls.setup({})
                end,

            },
        })

        local cmp = require('cmp')
        local cmp_select = {behavior = cmp.SelectBehavior.Select}
        -- local cmp_format = require('lsp-zero').cmp_format({details = true})

        cmp.setup({
            sources = {
                {name = 'nvim_lsp'},
                -- {name = 'buffer'},
            },
            -- formatting = cmp_format,
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                ['<C-y>'] = cmp.mapping.complete(),

                -- documentation window scroll
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
            }),
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
        })

        vim.diagnostic.config({ virtual_text = true })

        lsp.setup()
    end
}
