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
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = { "c", "rust", "javascript", "python", "vue", "css", "java", "typescript",
                    "latex" },
                highlight = {
                    enable = true,
                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
            }
        end,
        build = ":TSUpdate",
        event = "VeryLazy"
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = { 'nvim-treesitter/nvim-treesitter', opt = false },
        config = function()
            require 'nvim-treesitter.configs'.setup {
                textobjects = {
                    select = {
                        enable = true,

                        -- Automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,

                        keymaps = {
                            -- You can  the capture groups defined in textobjects.scm
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                        -- You can choose the select mode (default is charwise 'v')
                        selection_modes = {
                            ['@parameter.outer'] = 'v', -- charwise
                            ['@function.outer'] = 'V',  -- linewise
                            ['@class.outer'] = '<c-v>', -- blockwise
                        },
                        -- If you set this to `true` (default is `false`) then any textobject is
                        -- extended to include preceding xor succeeding whitespace. Succeeding
                        -- whitespace has priority in order to act similarly to eg the built-in
                        -- `ap`.
                        include_surrounding_whitespace = true,
                    },
                },
            }
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
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
        'neovim/nvim-lspconfig',
        dependencies = { "williamboman/mason-lspconfig.nvim", opt = false },
    },
    "williamboman/mason.nvim",
    {
        "aznhe21/actions-preview.nvim",
        config = function()
            vim.keymap.set({ "v", "n" }, "<leader>ac", require("actions-preview").code_actions)
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", opt = false },
        config = function()
            require("mason-lspconfig").setup()
        end,
    },
    {
        'simrat39/rust-tools.nvim',
    },
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'rafamadriz/friendly-snippets',
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
        end
    },
    {
        'scrooloose/nerdcommenter',
        setup = function()
            vim.g.NERDSpaceDelims = 1
            vim.g.NERDCompactSexyComs = 1
        end
    },
}
