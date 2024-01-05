return {
    { 'rose-pine/neovim', name = 'rose-pine' },
    { 'rebelot/kanagawa.nvim', name = 'kanagawa' },
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end,
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
    },
}
