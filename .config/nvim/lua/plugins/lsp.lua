return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
        },
        config = function()
            --Setup Completion
            --See https://github.com/hrsh7th/nvim-cmp#basic-configuration
            local cmp = require('cmp')
            --cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
            cmp.setup({
                -- Enable LSP snippets
                mapping = {
                    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<C-l>'] = cmp.mapping.confirm()
                },

                -- Installed sources
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'vsnip' },
                    { name = 'path' },
                    { name = 'buffer' },
                },
            })
        end
    },
    'rafamadriz/friendly-snippets',
    'neovim/nvim-lspconfig',
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        config = true
    },
    {
        "aznhe21/actions-preview.nvim",
        init = function()
            vim.keymap.set({ "v", "n" }, "<leader>ac", require("actions-preview").code_actions)
        end,
    },
}
