"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Configuration (VimRC)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus       " Use system clipboard
set number                      " Show line numbers
set relativenumber              " Relative line numbers
set history=500                 " Keep 500 lines of history
set autoread                    " Reload files when changed externally
set encoding=utf-8              " UTF-8 encoding
set timeoutlen=500              " Faster key sequence timeout

filetype plugin on              " Enable file type plugins
filetype indent on              " Enable file type indenting

" Auto-check for changes when focus is gained
au FocusGained,BufEnter * silent! checktime

" Leader key configuration
let mapleader = ","
nmap <leader>w :w!<cr>          " Fast saving with <leader>w

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Navigation Enhancements
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Center the screen when navigating with Ctrl-d and Ctrl-u
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Window navigation with Ctrl-h/j/k/l
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

" Toggle between the last two tabs
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Clear search highlights quickly
nnoremap <space><space> :noh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface Enhancements
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=7                 " Keep 7 lines visible when scrolling
set wildmenu                    " Enhanced command-line completion
set ruler                       " Show cursor position
set cmdheight=1                 " Command bar height
set lazyredraw                  " Redraw only when necessary
set showmatch                   " Highlight matching parentheses
set noerrorbells                " Disable error bells

set backspace=eol,start,indent  " Allow backspacing over everything
set whichwrap+=<,>,h,l          " Allow cursor to move across lines

" Search settings
set ignorecase                  " Case-insensitive search
set smartcase                   " Case-sensitive if uppercase letters are used
set hlsearch                    " Highlight search results
set incsearch                   " Incremental search

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable                   " Enable syntax highlighting
set background=dark             " Dark background for colorscheme
colorscheme desert              " Use 'desert' colorscheme

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File Management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup                    " No backup files
set noswapfile                  " No swap files

" Automatically clean trailing spaces before saving certain file types
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabs and Indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                   " Convert tabs to spaces
set smarttab                    " Smart tab behavior
set shiftwidth=4                " Indent with 4 spaces
set tabstop=4                   " Tab width is 4 spaces
set autoindent                  " Auto-indent new lines
set smartindent                 " Smart indentation for code

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map 0 ^                         " Jump to the first non-blank character
nmap <M-j> mz:m+<cr>`z          " Move line down with Alt-j
nmap <M-k> mz:m-2<cr>`z         " Move line up with Alt-k

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell Checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>ss :setlocal spell!<cr>  " Toggle spell checking with <leader>ss
