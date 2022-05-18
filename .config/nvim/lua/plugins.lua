local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'pest-parser/pest.vim'
    use { 'xiyaowong/nvim-transparent',
        config = function()
            require("transparent").setup {}
        end
    }
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
                    icons_enabled = false
                },
            }

        end,
    }
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup {}
        end
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            local telescope = require("telescope")
            telescope.load_extension('harpoon')
        end
    }
    use { 'ThePrimeagen/harpoon' }
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = { "c", "lua", "rust", "javascript", "python", "vue", "css" },
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
        config = function()
            require 'nvim-tree'.setup {
                git = { enable = false },
                renderer = { indent_markers = { enable = true } }
            }

            vim.api.nvim_set_keymap('', '<M-f>', ':NvimTreeToggle<CR>', { silent = true })
        end,
        keys = "<M-f>"
    }
    use 'neovim/nvim-lspconfig'
    use 'weilbith/nvim-code-action-menu'
    use 'williamboman/nvim-lsp-installer'
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
        'mattn/emmet-vim',
        ft = { 'html', 'vue' }
    }
    use 'ludovicchabant/vim-gutentags'

    -- Colorschemes
    use 'bluz71/vim-nightfly-guicolors'
    use 'bluz71/vim-moonfly-colors'
    use 'tomasr/molokai'
    use 'folke/tokyonight.nvim'
    use 'romgrk/doom-one.vim'
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
            -- Load colorscheme after options
            -- vim.cmd('autocmd VimEnter * ++nested colorscheme enfocado')
            -- vim.cmd('colorscheme enfocado')
        end,
    }
    use({
        "catppuccin/nvim",
        as = "catppuccin",
        disable = true
    })
    use 'ackyshake/Spacegray.vim'
    use 'ccarral/vim-code-dark'
    use 'joshdick/onedark.vim'
    use 'scrooloose/nerdcommenter'
    use 'mileszs/ack.vim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
