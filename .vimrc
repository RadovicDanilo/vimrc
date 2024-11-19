"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimRC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set number relativenumber
set history=500
set clipboard=unnamedplus  " Clipboard support in the IDE
filetype plugin on
filetype indent on
set autoread
au FocusGained,BufEnter * silent! checktime

let mapleader = ","
nmap <leader>w :w!<cr> " Fast saving

command! W execute 'w !sudo tee % > /dev/null' <bar> edit! " For Unix-based systems only

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => IDE User Interface Enhancements
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=7 " Keep cursor centered
set wildmenu " Enable better tab-completion

set ruler " Always show current position
set cmdheight=1 " Command line height

set backspace=eol,start,indent
set whichwrap+=<,>,h,l " Allow wrapping between lines with arrow keys

set ignorecase " Case insensitive search
set smartcase " Case-sensitive if search pattern has uppercase
set hlsearch " Highlight search results
set incsearch " Incremental search

set lazyredraw " Performance boost for macros
set showmatch " Highlight matching brackets

set noerrorbells " Disable annoying sound on errors
set timeoutlen=500 " Set timeout for mappings

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
set expandtab " Use spaces instead of tabs
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent " Auto indent
set smartindent " Smart indent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, buffers, and tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Window navigation
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
nmap <M-j> mz:m+<cr>`z " Move line down
nmap <M-k> mz:m-2<cr>`z " Move line up

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
