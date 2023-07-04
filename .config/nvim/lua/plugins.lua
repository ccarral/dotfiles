local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require("packer").init {
    auto_reload_compiled = true
}

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use { 'lewis6991/impatient.nvim',
        config = function()
            require('impatient')
        end
    }
    use 'editorconfig/editorconfig-vim'
    use { "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup {
                show_end_of_line = false,
                buftype_exclude = { "terminal" },
                filetype_exclude = { "startify" },
            }
        end
    }
    -- use { 'xiyaowong/nvim-transparent',
    -- config = function()
    -- require("transparent").setup {}
    -- end
    -- }

    use 'jamestthompson3/nvim-remote-containers'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = false },
        opt = false,
        config = function()
            require('lualine').setup {
                options = {
                    theme = require("transparent_lualine").theme(),
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
    }
    use {
        'simrat39/symbols-outline.nvim',
        config = function()
            require('symbols-outline').setup {}
        end
    }
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup {}
        end
    }
    use {
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
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        requires = { 'nvim-treesitter/nvim-treesitter', opt = false },
        config = function()
            require 'nvim-treesitter.configs'.setup {
                textobjects = {
                    select = {
                        enable = true,

                        -- Automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,

                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                        -- You can choose the select mode (default is charwise 'v')
                        selection_modes = {
                            ['@parameter.outer'] = 'v', -- charwise
                            ['@function.outer'] = 'V', -- linewise
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
    }
    use {
        "nvim-treesitter/nvim-treesitter-context",
        requires = { 'nvim-treesitter/nvim-treesitter', opt = false },
        config = function()
            require 'treesitter-context'.setup {}
        end
    }
    use 'andymass/vim-matchup'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use 'airblade/vim-gitgutter'
    use 'tpope/vim-obsession'
    use 'mhinz/vim-startify'
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-repeat'
    use 'tpope/vim-eunuch'
    use {
        'cespare/vim-toml',
        ft = { 'toml' }
    }
    use {
        'kkoomen/vim-doge',
        run = ':call doge#install()',
        cmd = "DogeGenerate"
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons', opt = false },
        config = function()
            require 'nvim-tree'.setup {
                git = { enable = false },
                actions = {
                    change_dir = {
                        enable = false,
                    },
                },
                renderer = { indent_markers = { enable = true },

                    -- icons = {
                    -- show = {
                    -- file = true,
                    -- folder_arrow = true,
                    -- git = false,
                    -- }
                    -- }
                },
            }
            vim.api.nvim_set_keymap('', '<M-f>', ':NvimTreeToggle<CR>', { silent = true })
        end,
        keys = "<M-f>"
    }
    use {
        'neovim/nvim-lspconfig',
        requires = { "williamboman/mason-lspconfig.nvim", opt = false },
    }
    use 'weilbith/nvim-code-action-menu'
    use {
        "williamboman/mason.nvim",
        run = ":MasonUpdate"
    }
    use {
        "williamboman/mason-lspconfig.nvim",
        requires = { "williamboman/mason.nvim", opt = false },
        config = function()
            require("mason-lspconfig").setup()
        end,
    }
    use {
        'simrat39/rust-tools.nvim',
    }
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use {
        'ThePrimeagen/harpoon',
        requires = 'nvim-lua/plenary.nvim'
    }
    use {
        'mattn/emmet-vim',
        ft = { 'html', 'vue', 'xml' }
    }
    use {
        'ludovicchabant/vim-gutentags',
    }
    use { 'norcalli/nvim-colorizer.lua',
        config = function()
            require 'colorizer'.setup {}
        end,
    }

    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- Colorschemes
    use 'bluz71/vim-nightfly-guicolors'
    use 'bluz71/vim-moonfly-colors'
    use 'folke/tokyonight.nvim'
    use 'romgrk/doom-one.vim'
    use {
        'rafamadriz/neon',
        config = function()
            vim.g.neon_style = "dark"
            vim.g.neon_italic_keyword = true
            vim.g.neon_italic_function = true
            vim.g.neon_transparent = true
        end
    }
    use 'yunlingz/equinusocio-material.vim'
    use {
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            -- Options (see available options below)
            vim.g.rose_pine_variant = 'moon'

            -- Load colorscheme after options
            -- vim.cmd('colorscheme rose-pine')
        end
    }
    use {
        'wuelnerdotexe/vim-enfocado',
        config = function()
            vim.g.enfocado_style = 'neon'
        end,
    }
    use({
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
            vim.cmd [[colorscheme catppuccin]]
        end
    })
    use 'ccarral/vim-code-dark'
    use 'joshdick/onedark.vim'
    use 'scrooloose/nerdcommenter'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
