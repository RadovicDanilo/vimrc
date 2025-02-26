"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Configuration (VimRC)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set clipboard=unnamedplus
set number
set relativenumber
set history=500
set autoread
set encoding=utf-8
set timeoutlen=500

filetype plugin on
filetype indent on

autocmd FocusGained,BufEnter * silent! checktime

let mapleader = ","
nmap <leader>w :w!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Navigation Enhancements
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzz
nnoremap N Nzz

nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

nmap <leader>l :bnext<CR>zz
nmap <leader>h :bprevious<CR>zz

nmap <leader>tn :tabnew<CR>
nmap <leader>tc :tabclose<CR>
nmap <leader>t<leader> :tabnext<CR>

let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
autocmd TabLeave * let g:lasttab = tabpagenr()

nnoremap <space><space> :noh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface Enhancements
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set scrolloff=7
set wildmenu
set ruler
set cmdheight=1
set lazyredraw
set showmatch
set noerrorbells

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase
set smartcase
set hlsearch
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
set background=dark
colorscheme desert

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File Management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nobackup
set noswapfile

function! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
autocmd BufWritePre *.txt,*.js,*.py,*.sh call CleanExtraSpaces()

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabs and Indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap 0 ^
nmap <M-j> mz:m+<CR>`z
nmap <M-k> mz:m-2<CR>`z

