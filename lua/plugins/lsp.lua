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
    },

    config = function ()
        local lsp = require('lsp-zero')

        -- lsp.on_attach(function(client, bufnr)
        --     lsp.default_keymaps({buffer = bufnr})
        -- end)

        lsp.preset('recommended')

        require('mason').setup({
            log_level = vim.log.levels.DEBUG
        })
        require('mason-lspconfig').setup({
            ensure_installed = {
                'lua_ls',
                'clangd',
                'rust_analyzer',
                'jedi_language_server@0.35.1',
            },
            handlers = {
                lsp.default_setup,

                ["lua_ls"] = function ()
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

                ["rust_analyzer"] = function ()
                    require('lspconfig').rust_analyzer.setup({
                    })
                end,

                ["clangd"] = function ()
                    require('lspconfig').clangd.setup({
                        -- cmd = {
                        --     "clangd-9",
                        --     "--compile-commands-dir=/home/andrew/.config/nvim/compile_flags.txt"
                        -- }
                    })
                end,

                ["pyright"] = function ()
                    require('lspconfig').pyright.setup({
                    })
                end,
            },
        })

        -- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
        -- require('lspconfig').rust_analyzer.setup({})
        -- require('lspconfig').clangd.setup({})
        -- require('lspconfig').pyright.setup({})

        local cmp = require('cmp')
        local cmp_select = {behavior = cmp.SelectBehavior.Select}

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                ['<C-y>'] = cmp.mapping.complete(),
            })
        })

        -- lsp.set_preferences({
        --     sign_icons = { }
        -- })

        vim.diagnostic.config({ virtual_text = true })

        lsp.setup()
    end
}
