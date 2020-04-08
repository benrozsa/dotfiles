call plug#begin('~/.local/share/nvim/plugged')

"---------------------
"----- TOOLS  --------
"---------------------

" Tree Navigation
Plug 'preservim/nerdtree'


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

