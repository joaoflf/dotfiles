"-- Basic --
set nocompatible    "don't bother with back compatibility
filetype plugin on

"-- Colors --
colorscheme codedark
set termguicolors   " work nicely with tmux
syntax enable       " enable syntax processing
autocmd BufRead,BufNew *.md setf markdown

"-- Spaces & Tabs --
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=4    " number of spaces in autoindent

" -- UI --
set number          " show line numbers
set showcmd         " show command in bottom bar
set cursorline      " highlight current line
filetype indent on  " load filetype-specific indent files
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " redraw only when we need to.
set showmatch       " highlight matching [{()}]

" -- Keys remap --
let mapleader= ","   " leader is comma

" -- Search -- 
set incsearch       " search as characters are entered
set hlsearch        " highlight matches

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" -- Splits --
set splitright
set splitbelow
nnoremap <C-J> <C-W><C-J>  
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"-- Find files --
set path+=**        " enable fuzzy search
set wildmenu        " display results on tab complete

