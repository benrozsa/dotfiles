call plug#begin('~/.local/share/nvim/plugged')

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
"----- TOOLS  --------
"---------------------

" Tree Navigation
Plug 'preservim/nerdtree'

" File Search
Plug 'junegunn/fzf'


" -------------------
" ----- STYLES  -----
" -------------------

" Theming
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'



" todo: find out what this does
Plug 'easymotion/vim-easymotion'


"------------------
"---- LANGUAGE ----
"------------------

" Intellisense, LSP, autosuggestions
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Language pack
Plug 'sheerun/vim-polyglot'

call plug#end()
colorscheme onedark

