return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("ibl").setup {
                exclude = {
                    filetypes = { "startify" },
                    buftypes = { "terminal" }
                },
            }
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
        lazy = false,
        config = function()
            require('lualine').setup {
                options = {
                    theme = require("transparent_lualine_wildcharm").theme(),
                    section_separators = '',
                    component_separators = '|',
                    extensions = 'nvim-tree',
                    icons_enabled = false,
                    sections = {
                        lualine_b = {
                            symbols = { error = ' ', warn = ' ', info = '', hint = '' }
                        }
                    }
                },
            }
        end,
    },
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.8',
        dependencies = 'nvim-lua/plenary.nvim'
    },
    {
        'rockerBOO/symbols-outline.nvim',
        config = true,
        cmd = "SymbolsOutline"

    },
    {
        'windwp/nvim-autopairs',
        config = true
    },
    'andymass/vim-matchup',
    'tpope/vim-surround',
    'tpope/vim-fugitive',
    'airblade/vim-gitgutter',
    'tpope/vim-obsession',
    'mhinz/vim-startify',
    'tpope/vim-unimpaired',
    'tpope/vim-repeat',
    'tpope/vim-eunuch',
    {
        'cespare/vim-toml',
        ft = { 'toml' }
    },
    {
        'kkoomen/vim-doge',
        build = ':call doge#install()',
        cmd = "DogeGenerate"
    },
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = { 'kyazdani42/nvim-web-devicons', opt = false },
        config = function()
            require 'nvim-tree'.setup {
                git = { enable = false },
                actions = {
                    change_dir = {
                        enable = false,
                    },
                },
                renderer = {
                    indent_markers = { enable = true },
                },
            }
            vim.api.nvim_set_keymap('', '<M-f>', ':NvimTreeToggle<CR>', { silent = true })
        end,
        keys = "<M-f>"
    },
    {
        'ThePrimeagen/harpoon',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function()
            vim.api.nvim_set_keymap('n', '<leader>ha', ':lua require("harpoon.mark").add_file()<CR>',
                { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>hb', ':lua require("harpoon.ui").toggle_quick_menu()<CR>',
                { noremap = true, silent = true })
        end
    },
    {
        'mattn/emmet-vim',
        ft = { 'html', 'vue', 'xml', 'eruby', 'typescriptreact' },
        setup = function()
            vim.g.r_emmet_leader_key = ','
        end
    },
    {
        'ludovicchabant/vim-gutentags',
        config = function()
            if vim.g.gutentags_project_info == nil then
                vim.g.gutentags_project_info = {}
            end
            vim.g.gutentags_cache_dir = vim.fn.expand('$HOME/.tags')
            -- This needs to be done beca table assignment in lua -> nvim is wacky
            vim.cmd [[ call add(g:gutentags_project_info, {'type': 'rust', 'file': 'Cargo.toml'}) ]]
            vim.g.gutentags_ctags_executable_rust = vim.fn.expand('$HOME/.config/nvim/shims/rusttags.sh')
        end,
    },
    {
        'norcalli/nvim-colorizer.lua',
        cmd = "ColorizerAttachToBuffer"
    },
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = true
    },
    {
        'scrooloose/nerdcommenter',
        setup = function()
            vim.g.NERDSpaceDelims = 1
            vim.g.NERDCompactSexyComs = 1
        end
    },
}
