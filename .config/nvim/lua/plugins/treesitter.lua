return {
    {
        'nvim-treesitter/nvim-treesitter',
        opts = {},
        build = ":TSUpdate",
        lazy = false,
        branch = "main",
        init = function()
            vim.api.nvim_create_autocmd('FileType', {
                pattern = { 'terraform', 'python', 'lua', 'bash', 'dockerfile' },
                callback = function()
                    vim.treesitter.start()
                end,
            })
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = { 'nvim-treesitter/nvim-treesitter', opt = false },
        branch = "main"
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = true
    },
}
