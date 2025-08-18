
" --- Syntax ---
syntax on                  " Enable syntax highlighting
set background=dark        " Use dark background colors

" --- Line numbers and movement ---
set number                 " Show absolute line numbers
set relativenumber         " Show relative line numbers
set cursorline             " Highlight current line
set signcolumn=yes         " Always show sign column
set showmatch              " Highlight matching brackets

" --- Navigation and search ---
set incsearch              " Incremental search
set hlsearch               " Highlight search results
set ignorecase             " Case insensitive search
set smartcase              " Case sensitive if uppercase used

" --- Indentation ---
set tabstop=4              " Number of spaces tabs count for
set shiftwidth=4           " Number of spaces to use for autoindent
set expandtab              " Use spaces instead of tabs
set autoindent             " Copy indent from current line
set smartindent            " Smart autoindenting
set softtabstop=4          " Number of spaces tabs count for in insert mode

" --- Encoding ---
set encoding=utf-8         " Use UTF-8 encoding

" --- Clipboard support ---
set clipboard=unnamedplus  " Use system clipboard

" --- Improved backspace ---
set backspace=indent,eol,start  " Make backspace more powerful

" --- Basic behavior ---
set nocompatible           " Disable Vi compatibility
set mouse=a                " Enable mouse support

" --- Persistent undo ---
set undofile               " Enable undo file
set undodir=~/.vim/undodir " Directory for undo files

" --- Status line ---
set laststatus=2           " Always show status line
set ruler                  " Show cursor position

" --- Filetype detection and smart indent ---
filetype plugin indent on  " Enable filetype detection and indenting

" --- Key mappings ---
nnoremap <Space> :nohlsearch<CR> " Clear search highlighting with Space
inoremap jk <Esc>                " jk to escape in insert mode
