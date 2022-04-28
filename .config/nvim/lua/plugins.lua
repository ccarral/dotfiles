return require('packer').startup(function()
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'pest-parser/pest.vim'
    use {
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = false},
      opt=false,
      config = function()
          local lualine = require('lualine').setup{ 
              options = { 
                  theme = 'enfocado' , 
                  section_separators = '', 
                  component_separators = '|', 
                  extensions='nvim-tree', 
                  icons_enabled = false
              },
          }

      end,
    }
    use{  
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup{}
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require'nvim-treesitter.configs'.setup {
                highlight = {
                    enable = true,
                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
            }
            vim.api.nvim_set_keymap('', '<M-f>', ':NvimTreeToggle<CR>', {silent=true})
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
    use 'justinmk/vim-sneak'
    use 'tpope/vim-eunuch'
    use 'cespare/vim-toml'
    use {
        'kkoomen/vim-doge', 
        run = ':call doge#install()',
    }

    use {
        'kyazdani42/nvim-tree.lua',
        config = function()
-- │
            require 'nvim-tree'.setup{
                git={enable = true},
                renderer = { indent_markers = { enable = true}}
            }

            vim.cmd('map <M-f> :NvimTreeToggle<CR>')
        end
    }
    use 'neovim/nvim-lspconfig'
    use 'weilbith/nvim-code-action-menu'
    use 'williamboman/nvim-lsp-installer'
    use 'simrat39/rust-tools.nvim'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    -- use 'nvim-telescope/telescope.nvim'
    use 'mattn/emmet-vim'
    use 'ludovicchabant/vim-gutentags'

    -- Colorschemes
    use 'bluz71/vim-nightfly-guicolors'
    use 'bluz71/vim-moonfly-colors'
    use 'tomasr/molokai'
    use 'folke/tokyonight.nvim'
    use 'romgrk/doom-one.vim'
    use 'yunlingz/equinusocio-material.vim'
    use{
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
        end
    }
    use({
        "catppuccin/nvim",
        as = "catppuccin"
    })
    use 'arthurealike/vim-J'
    use 'mhartington/oceanic-next'
    use 'ackyshake/Spacegray.vim'
    use 'ccarral/vim-code-dark'
    use 'joshdick/onedark.vim'
    use 'scrooloose/nerdcommenter'
    use 'mileszs/ack.vim'
end)
