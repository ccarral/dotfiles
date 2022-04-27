" File              : .vimrc
" Author            : Carlos Carral <carloscarral13@gmail.com>
" Date              : 10.08.2020
" Last Modified Date: 19/08/2020
"------------- ------------
"       Custm vim
"------------- ------------
set conceallevel=3

"   Line Nr
set relativenumber
set number
set cursorline

" Persistent undo
set undofile

filetype plugin indent on

set encoding=UTF-8
set fillchars=vert:│

"   Indentation
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set scrolloff=3
set ruler
set nrformats-=octal
set textwidth=74

set signcolumn=number
set guicursor=

tnoremap <Esc><Esc> <C-\><C-n>
"   Leader
let mapleader = ","

"   Splitting settings
set splitbelow
set splitright

"   Recursive path
set path+=**

"   Wildmenu
set wildmenu

let g:termdebug_wide = 1
let g:markdown_fenced_languages=["rust","bash", "sql","man"]

"   Disable default plugins
let g:loaded_matchparen        = 1
let g:loaded_matchit           = 1
let g:loaded_logiPat           = 1
let g:loaded_rrhelper          = 1
let g:loaded_tarPlugin         = 1
let g:loaded_gzip              = 1
let g:loaded_zipPlugin         = 1
let g:loaded_2html_plugin      = 1
let g:loaded_shada_plugin      = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_remote_plugins    = 1


"   Mapping kj -> ESC 
inoremap kj <ESC>
inoremap KJ <ESC>

"   Mapping cc-> :commmand
map cc <ESC> :

"   Buffer change
nnoremap <leader>b :ls<CR>:b<space>

"   Write key-binding
nnoremap <Leader>w :w<CR>

"   Tag kb
nnoremap <Leader>t :tag<Space>

"   vsplit kb
nnoremap <Leader>v :vsplit<CR>

"   Git maps
nnoremap <Leader>gs :Git<CR> 
nnoremap <Leader>gc :Git commit<CR> 

"   Unmap J deletion
map J <NOP>


"   Clipboard Mapping
vnoremap <C-c> "+y
inoremap <C-v> <ESC>"+pa

nnoremap <Leader>f :find 
nnoremap <Leader>e :edit 

"   Mapeos para cambiar de buffer
map <C-w> <C-w><C-w>


"   Autowrite & Autoread
set autoread
set autowrite


set termguicolors
syntax enable
lua require('plugins')
" let g:edge_style = 'neon'
" colorscheme edge 
" colorscheme nightfly 
colorscheme moonfly 
" colorscheme catppuccin 
" colorscheme codedark
" colorscheme onedark 
" colorscheme rose-pine 
" colorscheme enfocado 
" colorscheme koehler 
" colorscheme spaceduck 

" Term colors


"======================== nvim-lsp =============================
set completeopt=menuone,noinsert,noselect
lua require('lsp')
"==============================================================

"======================== coc-nvim=============================
" GoTo code navigations.
" autocmd User CocNvimInit nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" nmap <leader>ac  <Plug>(coc-codeaction)

" nmap <F9> <Plug>(coc-rename)

" Map function and class text objects
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)


" ================ vim-header ====================
let g:header_field_author = 'Carlos Carral'
let g:header_field_author_email = 'carloscarral13@gmail.com'
let g:header_field_modified_by = 0
let g:header_field_timestamp_format = '%d/%m/%Y'
let g:header_auto_add_header = 0
" ================================================

" ================ git-gutter ====================
" ================================================

"===================== vimtex =================================
let g:tex_flavor = 'latex'
"==============================================================

" ================ vim-man ====================
map <Leader>k <Plug>(Man)
" =============================================


" set background=black

hi Comment cterm=italic
" hi LineNr ctermbg=NONE guibg=NONE

" set term=screen-256color

"===================== colorschemes ========================
" let g:tokyonight_italic_functions = 1
" let g:tokyonight_style = "night"
" colorscheme github
let g:equinusocio_material_style = 'darker'
" let g:lightline = { 'colorscheme': '' }
" let g:lightline ={'colorscheme': 'catppuccin'} 
" lua require("catppuccin").set_up({})
let g:codedark_italics = 1
" colorscheme codedark 
" colorscheme equinusocio_material
" colorscheme spacegray 

hi LspDiagnosticsDefaultError ctermfg=Red guifg=#ff4545
hi LspDiagnosticsDefaultWarning ctermfg=Yellow guifg=#ffc86b   
hi LspDiagnosticsDefaultHint ctermfg=Red guifg=#ababab
"

"===========================================================

""===================== statusline ========================
set noshowmode
set laststatus=2
"==========================================================

"====================== lightline =========================
"==========================================================

"===================== NvimTree ========================
let g:nvim_tree_respect_buf_cwd = 1
"lua require 'nvim-tree'.setup{} 
map <M-f> :NvimTreeToggle<CR>
"===========================================================

"===================== emmet ========================
let g:user_emmet_leader_key=','
"====================================================


"===================== tagbar ========================
noremap <M-t> :TagbarToggle<CR>
"====================================================


"===================== gutentags ==========================
if !exists("g:gutentags_project_info")
  let g:gutentags_project_info = []
endif
call add(g:gutentags_project_info, {'type': 'rust', 'file': 'Cargo.toml'})
let g:gutentags_ctags_executable_rust = $HOME.'/.vim/shims/rusttags.sh'

"===================== NERDComment =========================
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs=1
"===========================================================



"===================== vim-todo ============================
let g:todo_vertical=1
let g:todo_right=1
"===========================================================

"================== recognize header files as C ============
augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END
"===========================================================


"   Autoclose preview window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"   Sneak
let g:sneak#label = 1

"   Startify settings
"===================== startify ========================
let g:startify_change_to_dir = 0
let g:startify_session_autoload = 1
let g:startify_bookmarks = [{'v':'~/.config/nvim/init.vim','w':'~/.config/nvim/lua/lsp.lua'}]
let g:startify_lists = [
                    \ {'type': 'dir',   'header': ['        '.split(getcwd(),"\/")[-1]]},
                    \ {'type': 'sessions',   'header': ['        Sesiones']},
                    \ {'type': 'bookmarks',   'header': ['        Bookmarks']},
                    \ ]
let g:startify_fortune_use_unicode = 1
let g:startify_padding_left = 8
let g:startify_files_number = 4
let header_ascii_art_VIM = [
            \'                                                     ',
            \'                                                     ',
            \'              ██╗   ██╗██╗███╗   ███╗                ',
            \'              ██║   ██║██║████╗ ████║                ',
            \'              ██║   ██║██║██╔████╔██║                ',
            \'              ╚██╗ ██╔╝██║██║╚██╔╝██║                ',
            \'               ╚████╔╝ ██║██║ ╚═╝ ██║                ',
            \'                ╚═══╝  ╚═╝╚═╝     ╚═╝                ',
            \'                                                     ',
            \'                                                     ']


let g:startify_custom_header = startify#center(header_ascii_art_VIM + startify#pad(startify#fortune#cowsay()))
"===========================================================


runtime plugin/dragvisuals.vim                                  
vmap  <expr>  <LEFT>   DVB_Drag('left')                         
vmap  <expr>  <RIGHT>  DVB_Drag('right')                        
vmap  <expr>  <DOWN>   DVB_Drag('down')                         
vmap  <expr>  <UP>     DVB_Drag('up')                           
vmap  <expr>  D        DVB_Duplicate()                          

function Fecha()
    read !date
endfunction 

command! Fecha call Fecha()

