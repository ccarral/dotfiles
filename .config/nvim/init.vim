"------------- ------------
"       Custom neovim
"------------- ------------

" Disable mouse
set mouse=

set ignorecase

"   Line Nr
set relativenumber
set number
set cursorline

" Persistent undo
set undofile

set updatetime=100

"   Indentation
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set scrolloff=3
set nrformats-=octal

set signcolumn=yes:1
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

set grepprg=rg\ --vimgrep

" let g:termdebug_wide = 1
"let g:markdown_fenced_languages=["rust","bash", "sql","man", "terraform", "sh", "conf", "perl"]


"   Buffer change
nnoremap <leader>b :ls<CR>:b<space>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>t :tag<Space>
nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>f :find 
nnoremap <Leader>e :edit 
"   Clipboard Mapping
vnoremap <C-c> "+y
inoremap <C-v> <ESC>"+pa

"   Git maps
nnoremap <Leader>gs :Git<CR> 
nnoremap <Leader>gc :Git commit<CR> 
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

"   Unmap J deletion
map J <NOP>




"   Mapeos para cambiar de buffer
" nnoremap <C-w> <C-w><C-w>

"   Autowrite & Autoread
set autowrite


set completeopt=menuone,noinsert,noselect

"===================== colorschemes ========================
augroup TransparentBackground
autocmd!
autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
autocmd ColorScheme * highlight NonText ctermbg=none guibg=none
augroup END
colorscheme vim

"======================== nvim-lsp =============================
lua require('bootstrap')
lua require('lazy').setup("plugins")
lua require('lsp')
"==============================================================

"====================== statusline ========================
" set noshowmode
"==========================================================

"================== recognize header files as C ============
augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END
"===========================================================


"   Autoclose preview window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"===================== legacy ascii art ========================
"let header_ascii_art_VIM = [
            "\'                ',
            "\'                ',
            "\'                ',
            "\'                ',
            "\'                ',
            "\'                ',
            "\'                ',
            "\'                ',
            "\'┏┓╻┏━╸┏━┓╻ ╻╻┏┳┓',
            "\'┃┗┫┣╸ ┃ ┃┃┏┛┃┃┃┃',
            "\'╹ ╹┗━╸┗━┛┗┛ ╹╹ ╹',
            "\'                ']

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
" let header_ascii_art_VIM = [
            " \'                                                ',
            " \'                                                ',
            " \'                                                ',
            " \'                                                ',
            " \'                                                ',
            " \'                                                ',
            " \'                                                ',
            " \'                                                ',
            " \'                                                ',
            " \'                                                ',
            " \'┌──────┐┌──────┐┌──────┐┌      ┐┌──────┐┌───┐──┐',
            " \'│      ││      ││      ││      │    │   │      │',
            " \'│      ││──────┘│      │└──┐   │    │   │      │',
            " \'└     ─┘└──────┘└──────┘   └───┘└───└──┘└      ┘']

"===========================================================

function Fecha()
    read !date +"\#\# Standup for \%F" && printf "-------------------------\n"
endfunction 

function Standup()
    normal gg
    call Fecha()
    read !print_standup_tasks.sh

endfunction

command! Fecha call Fecha()

command! Standup call Standup()

function DisableAutoformat()
    set eventignore+=BufWritePre
endfunction

function EnableAutoformat()
    set eventignore=''
endfunction

function EnableHints()
    lua vim.lsp.inlay_hint.enable(true)
endfunction

function DisableHints()
    lua vim.lsp.inlay_hint.enable(false)
endfunction

if !argc() && filereadable('Session.vim')
    source Session.vim
endif

command! DisableAutoformat call DisableAutoformat()
command! EnableAutoformat call EnableAutoformat()
command! EnableHints call EnableHints()
command! DisableHints call DisableHints()
