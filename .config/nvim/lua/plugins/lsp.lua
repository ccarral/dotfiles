return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
        }
    },
    'rafamadriz/friendly-snippets',
    {
        'neovim/nvim-lspconfig',
        dependencies = { "williamboman/mason-lspconfig.nvim", opt = false },
    },
    "williamboman/mason.nvim",
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = "williamboman/mason.nvim",
        config = true
    },
    {
        "aznhe21/actions-preview.nvim",
        config = function()
            vim.keymap.set({ "v", "n" }, "<leader>ac", require("actions-preview").code_actions)
        end,
    },
}
