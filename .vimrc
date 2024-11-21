"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimRC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus  " Clipboard support
set number
set relativenumber
set history=500
filetype plugin on
filetype indent on
set autoread
au FocusGained,BufEnter * silent! checktime

let mapleader = ","
nmap <leader>w :w!<cr> " Fast saving

command! W execute 'w !sudo tee % > /dev/null' <bar> edit! " For Unix-based systems only

" Center screen when navigating
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" QuickScope
set quickscope
let g:qs_lazy_highlight = 1
let g:qs_highlight_on_keys = ['f', 't', 'F', 'T']

highlight QuickScopePrimary guifg=#ff4500 gui=bold
highlight QuickScopeSecondary guifg=#696969

autocmd FileType markdown let b:qs_enable = 0
autocmd FileType html let b:qs_enable = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => IDE User Interface Enhancements
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=7
set wildmenu
set ruler
set cmdheight=1

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase
set smartcase
set hlsearch
set incsearch

set lazyredraw
set showmatch
set noerrorbells
set timeoutlen=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
colorscheme desert
set encoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabs and indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, buffers, and tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Buffer navigation
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Tab navigation
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>t<leader> :tabnext<cr>

" Toggle between last two tabs
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map 0 ^ " Jump to the first non-blank character
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>ss :setlocal spell!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc and Helper Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
autocmd BufWritePre *.txt,*.js,*.py,*.sh call CleanExtraSpaces()

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
