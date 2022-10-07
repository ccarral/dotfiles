"------------- ------------
"       Custom neovim
"------------- ------------
set conceallevel=3


"   Line Nr
set relativenumber
set number
set cursorline

" Persistent undo
set undofile

filetype plugin indent on

set updatetime=100

"   Indentation
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set scrolloff=3
" set ruler
set nrformats-=octal
" set textwidth=74

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

" This presented some issues
" let g:do_filetype_lua = 1

" Ripgrep
if executable('rg')
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m,%f:%l:%m
endif


"   Mapping kj -> ESC 
inoremap kj <ESC>
inoremap KJ <ESC>

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
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

"   Unmap J deletion
map J <NOP>


"   Clipboard Mapping
vnoremap <C-c> "+y
inoremap <C-v> <ESC>"+pa

nnoremap <Leader>f :find 
nnoremap <Leader>e :edit 

"   Mapeos para cambiar de buffer
nnoremap <C-w> <C-w><C-w>

nnoremap <Leader>tn<CR> :tabnext<CR>
nnoremap <Leader>tp<CR> :tabprev<CR>
nnoremap <Leader>te :tabedit
nnoremap <Leader>tb :tabs

" Harpoon
nnoremap <leader>ha :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hb :lua require("harpoon.ui").toggle_quick_menu()<CR>

"   Autowrite & Autoread
set autoread
set autowrite


set termguicolors
syntax enable

"===================== NERDComment =========================
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs=1
"===========================================================

lua require('plugins')
"===================== colorschemes ========================
hi LspDiagnosticsDefaultError ctermfg=Red guifg=#ff4545
hi LspDiagnosticsDefaultWarning ctermfg=Yellow guifg=#ffc86b   
hi LspDiagnosticsDefaultHint ctermfg=Red guifg=#ababab
hi Comment cterm=italic
let g:nightflyTransparent = 1
let g:moonflyTransparent = 1
let g:tokyonight_style = 'night'
let g:tokyonight_transparent = 1 
let g:tokyonight_transparent_sidebar = 1 
colorscheme catppuccin

"======================== nvim-lsp =============================
set completeopt=menuone,noinsert,noselect
lua require('lsp')
"==============================================================

"====================== statusline ========================
set noshowmode
set laststatus=2
"==========================================================

"===================== emmet ========================
let g:user_emmet_leader_key=','
"====================================================

"===================== gutentags ==========================
if !exists("g:gutentags_project_info")
  let g:gutentags_project_info = []
endif
let g:gutentags_cache_dir=$HOME.'/.tags'
call add(g:gutentags_project_info, {'type': 'rust', 'file': 'Cargo.toml'})
let g:gutentags_ctags_executable_rust = $HOME.'/.vim/shims/rusttags.sh'

"================== recognize header files as C ============
augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END
"===========================================================


"   Autoclose preview window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"   Startify settings
"===================== startify ========================
let g:startify_change_to_dir = 0
let g:startify_enable_special = 1
let g:startify_session_autoload = 1
let g:startify_files_number = 0
let g:startify_bookmarks = [{'v':'~/.config/nvim/init.vim'}]
let g:startify_lists = [{'type': 'bookmarks','header': ['']}, { 'type': 'sessions','header': ['sesiones']},]
let g:startify_fortune_use_unicode = 1
let g:startify_padding_left = 70 
let g:startify_files_number = 4

" let header_ascii_art_VIM = [
            " \'                ',
            " \'                ',
            " \'                ',
            " \'                ',
            " \'                ',
            " \'                ',
            " \'                ',
            " \'                ',
            " \'┏┓╻┏━╸┏━┓╻ ╻╻┏┳┓',
            " \'┃┗┫┣╸ ┃ ┃┃┏┛┃┃┃┃',
            " \'╹ ╹┗━╸┗━┛┗┛ ╹╹ ╹',
            " \'                ']

" let header_ascii_art_VIM = [
            " \" _____________________" ,
            " \"(  ┏┓╻┏━╸┏━┓╻ ╻╻┏┳┓   )",
            " \"(  ┃┗┫┣╸ ┃ ┃┃┏┛┃┃┃┃   )",
            " \"(  ╹ ╹┗━╸┗━┛┗┛ ╹╹ ╹   )",
            " \" ---------------------" ,
            " \"      o                    / \  //\\",
            " \'       o    |\___/|      /   \//  \\',
            " \'            /0  0  \__  /    //  | \\ \\'    ,
            " \'           /     /  \/_/    //   |  \\  \\'  ,
            " \"          @_^_@/     \/_    //    |\   \\" ,
            " \'           //_^_/     \/_ //     |    \    \',
            " \'        ( //) |        \///      |     \     \',
            " \'      ( / /) _|_ /   )  //       |      \     _\',
            " \"    ( // /) '/,_ _ _/  ( ; -.    |    _ _\.-~        .-~~~^-.",
            " \'  (( / / )) ,-{        _      `-.|.-~-.           .~         `.',
            " \" (( // / ))  '/\      /                 ~-. _ .-~      .-~^-.  \\",
            " \' (( /// ))      `.   {            }                   /      \  \',
            " \"  (( / ))     .----~-.\        \-'                 .~         \  `. \^-.",
            " \'             ///.----..>        \             _ -~             `.  ^-`  ^-_',
            " \'               ///-._ _ _ _ _ _ _}^ - - - - ~                     ~-- ,.-~',
            " \'                                                                          ',]
let header_ascii_art_VIM = [
            \'                                                ',
            \'                                                ',
            \'                                                ',
            \'                                                ',
            \'                                                ',
            \'                                                ',
            \'                                                ',
            \'                                                ',
            \'                                                ',
            \'                                                ',
            \'┌──────┐┌──────┐┌──────┐┌      ┐┌──────┐┌───┐──┐',
            \'│      ││      ││      ││      │    │   │      │',
            \'│      ││──────┘│      │└──┐   │    │   │      │',
            \'└     ─┘└──────┘└──────┘   └───┘└───└──┘└      ┘']

let g:startify_custom_header = startify#center(header_ascii_art_VIM)
"===========================================================

function Fecha()
    read !date
endfunction 

command! Fecha call Fecha()

