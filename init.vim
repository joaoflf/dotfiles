"-- Basic --
filetype plugin on

"-- Plugins (via vim-plug) -- 
call plug#begin('~/.vim/plugged')   " Specify a directory for plugins
Plug 'neomake/neomake'
Plug 'rakr/vim-one'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
Plug 'junegunn/fzf.vim'
Plug 'sbdchd/neoformat'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
call plug#end() " Initialize plugin system
nnoremap <silent> <C-P> :FZF<cr>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

call neomake#configure#automake('nrwi', 500)
let g:neomake_python_pylint_exe = ['mypy', 'pep8']
let g:neoformat_python_autopep8 = {
    \ 'exe': 'autopep8',
    \ 'args': ['-s 4', '-E'],
    \ 'replace': 1,
    \ 'stdin': 1,
    \ 'env': ["DEBUG=1"],
    \ 'valid_exit_codes': [0, 23],
    \ 'no_append': 1}

let g:neoformat_enabled_python = ['autopep8']

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
nnoremap <M-m> :MarkdownPreview<CR>

"-- Colors --
set termguicolors   " work nicely with tmux
colorscheme one
set background=dark 
syntax enable       " enable syntax processing
autocmd BufRead,BufNew *.md setf markdown

"-- Spaces & Tabs --
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=4    " number of spaces in autoindent
set textwidth=79
set autoindent


" -- UI --
set number          " show line numbers
set showcmd         " show command in bottom bar
set cursorline      " highlight current line
filetype indent on  " load filetype-specific indent files
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " redraw only when we need to.
set showmatch       " highlight matching [{()}]
set relativenumber  " turn relative line numbers on
set rnu
set clipboard+=unnamedplus "shared clipboard

" -- Keys remap --
let mapleader= ","   " leader is comma
noremap <Up> <Nop>   " Disable arrows
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

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


