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


" Start of Nvim plugins
call plug#begin('~/.local/share/nvim/plugged')

" File Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Theming
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Intellisense, LSP, autosuggestions
Plug 'neovim/nvim-lspconfig'

" End of Nvim plugins
call plug#end()


let g:one_allow_italics = 1     " I love italic for comments
syntax on                       " Turn on syntax highlight
filetype plugin indent on        " Better indents maybe
colorscheme onedark             " Set color scheme
set termguicolors               " Use true colors in terminal
