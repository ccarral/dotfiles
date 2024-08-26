return {
    -- Colorschemes
    'Abstract-IDE/Abstract-cs',
    {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            require("catppuccin").setup {
                compile = {
                    enabled = true,
                    path = vim.fn.stdpath("cache") .. "/catppuccin",
                },
                transparent_background = true,
                term_colors = false,
                integrations = {
                    treesitter = true,
                    gitgutter = true,
                    cmp = true,
                    native_lsp = {
                        enabled = true
                    },
                    nvimtree = {
                        enabled = true,
                        transparent_panel = true
                    }
                },
            }
        end,
        enabled = false
    },
}
