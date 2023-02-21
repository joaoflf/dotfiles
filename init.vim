"-------------------------------------------------
"-- Plugins (via vim-plug) -- 
"-------------------------------------------------

call plug#begin('~/.vim/plugged')   " Specify a directory for plugins
Plug 'neomake/neomake'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
Plug 'junegunn/fzf.vim'
Plug 'sbdchd/neoformat'
Plug 'chriskempson/base16-vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
call plug#end() " Initialize plugin system

"-------------------------------------------------
" -- UI -- 
"-------------------------------------------------

"-- Colors --
let base16colorspace=256  " Access colors present in 256 colorspace
set termguicolors     " enable true colors support
colorscheme base16-material
let g:airline_theme= "base16_spacemacs"
let g:airline#extensions#branch#enabled = 1

" -- Spaces & Tabs --
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=4    " number of spaces in autoindent
set textwidth=79

" -- Other --
set number          " show line numbers
set showcmd         " show command in bottom bar
set cursorline      " highlight current line
filetype indent on  " load filetype-specific indent files
set lazyredraw      " redraw only when we need to.
set showmatch       " highlight matching [{()}]
set relativenumber  " turn relative line numbers on
set rnu
set clipboard+=unnamedplus "shared clipboard

"-------------------------------------------------
" -- Keys remap --
"-------------------------------------------------

let mapleader= ","   " leader is comma
" disable arrows
noremap <Up> <Nop> 
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

"-------------------------------------------------
" -- Utilities --
"-------------------------------------------------

"" -- Splits --
set splitright
set splitbelow
nnoremap <C-J> <C-W><C-J>  
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"-- Find files --
set path+=**        " enable fuzzy search
set wildmenu        " display results on tab complete

"-- FZF Options -- 
nnoremap <silent> <C-P> :FZF<cr>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

