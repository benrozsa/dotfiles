

syntax on           " Turn on syntax highlighting, or really
                    " color coding.
                    " This really helps you spot broken
                    " syntax as you type.

set t_Co=256

" set number          " Show line number for each line
set wildmenu
set showcmd
set nocompatible
set background=dark
set backspace=indent,eol,start
set wrapmargin=8
set encoding=utf-8

set showmatch       " Show matches for () [] {}

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


                    " Autoformat on F3
noremap <F3> :Autoformat<CR>


set hlsearch        " Highlight search results

" set mouse=a         " Enable mouse scrolling

                    " Load onedark colorscheme from pack/*/opt
" packadd! onedark.vim
" colorscheme onedark

                    " Move cursor inside page 
                    " when scrolling via trackpad
map <ScrollWheelDown> j
map <ScrollWheelUp> k
