set number          " Show line number for each line
set autoindent      " Copy indent from current line when
                    " Starting a new line

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
set ruler           " Show at which column and row
                    " The cursor is in characters

set colorcolumn=80  " Show a red line to maintain standard
                    " Line length


"---------------------
"-- NEOVIM PLUGINS ---
"---------------------

call plug#begin('~/.local/share/nvim/plugged')

" nmap <F6> :NERDTreeToggle<CR>
" map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

"---------------------
"----- TOOLS  --------
"---------------------

" Tree Navigation
Plug 'preservim/nerdtree'

" File Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" -------------------
" ----- STYLES  -----
" -------------------

" Theming
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Show Git Diff
Plug 'airblade/vim-gitgutter'

" todo: find out what this does
Plug 'easymotion/vim-easymotion'

"------------------
"---- LANGUAGE ----
"------------------

" Intellisense, LSP, autosuggestions
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Language pack
Plug 'sheerun/vim-polyglot'

" Create :Prettier command
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

    " End of Nvim plugins
call plug#end()


"------------------
"--- VIM CONFIG ---
"------------------

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:one_allow_italics = 1     " I love italic for comments
let g:rustfmt_autosave = 1      " Autoformat Rust on save
syntax on                       " Turn on syntax highlight
filetype plugin indent on       " Better indents maybe
colorscheme onedark
set termguicolors               " Use true colors in terminal

