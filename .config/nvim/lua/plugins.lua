return require('packer').startup(function()
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = false},
      opt=false,
      config = function()
          local lualine = require('lualine').setup{ 
              options = { 
                  -- theme = 'enfocado' , 
                  -- theme = 'onedark' , 
                  -- theme = 'nightfly' , 
                  theme = 'rose-pine' , 
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
        end
    }
    use {  
        'wuelnerdotexe/vim-enfocado',
        config = function()
            vim.g.enfocado_style = 'neon'
            -- Load colorscheme after options
            -- vim.cmd('autocmd VimEnter * ++nested colorscheme enfocado')
        end
    }
    use 'andymass/vim-matchup'
    use 'preservim/tagbar'
    -- use 'Dimercel/todo-vim', {'on': 'TODOToggle'}
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-obsession'
    use 'mhinz/vim-startify'
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-dispatch'
    use 'tpope/vim-repeat'
    use 'justinmk/vim-sneak'
    use 'tpope/vim-eunuch'
    use 'cespare/vim-toml'
    --Plug 'kkoomen/vim-doge', {'do':{->doge#install()}}

    use {
	'kyazdani42/nvim-tree.lua',
	config = function()
		require 'nvim-tree'.setup{}
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
    use 'nvim-telescope/telescope.nvim'
    use 'mattn/emmet-vim'
    use 'ludovicchabant/vim-gutentags'

    -- Colorschemes
    use 'tomasr/molokai'
    use 'folke/tokyonight.nvim'
    use 'romgrk/doom-one.vim'
    use 'yunlingz/equinusocio-material.vim'
    use 'shaunsingh/nord.nvim'
    use{
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            -- Options (see available options below)
            vim.g.rose_pine_variant = 'moon'

            -- Load colorscheme after options
            vim.cmd('colorscheme rose-pine')
        end
    }
    --use 'vmchale/ion-vim' , {'for':['javascript']}
    use 'arthurealike/vim-J'
    use 'mhartington/oceanic-next'
    use 'ackyshake/Spacegray.vim'
    use 'ccarral/vim-code-dark'
    use 'joshdick/onedark.vim'
    --use 'pangloss/vim-javascript', {'for': ['javascript']}
    --use 'gavocanov/vim-js-indent', {'for':['javascript']}
    use 'scrooloose/nerdcommenter'
    use 'mileszs/ack.vim'
end)
