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

        lsp.preset('recommended')

        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                'clangd',
                'gopls',
                'lua_ls',
                'pylsp',
                'dockerls',
            },
            handlers = {
                lsp.default_setup,
            },
        })

        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

        local cmp = require('cmp')
        local cmp_select = {behavior = cmp.SelectBehavior.Select}

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
            })
        })

        lsp.set_preferences({
            sign_icons = { }
        })

        lsp.setup()
    end
}
