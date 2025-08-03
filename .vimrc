" Syntax highlighting and colors
syntax on
set t_Co=256
set background=dark

" Line numbers and movement
set number               " Line numbers
set relativenumber       " Relative line numbers – better movement
set cursorline           " Highlight current line
set showmatch            " Highlight matching brackets

" Navigation and search
set showcmd              " Show typed commands
set wildmenu             " Completion menu
set incsearch            " Search while typing
set hlsearch             " Highlight search results

" TAB handling and indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

" Character encoding
set encoding=utf-8

" Clipboard support (only if Vim has +clipboard)
set clipboard=unnamedplus

" Improved backspace
set backspace=indent,eol,start

" Wrap margin
set wrapmargin=8

" Disable compatibility
set nocompatible
" Mouse support
set mouse=a

" Persistent undo
set undofile
set undodir=~/.vim/undodir

" Faster scrolling
set ttyfast

" Improved search (case-insensitive, smartcase)
set ignorecase
set smartcase

" Better colors if supported
if (has("termguicolors"))
  set termguicolors
endif

" Improved status line
set laststatus=2
set ruler

" Plugin support (if needed)
filetype plugin indent on

" Useful key mappings
nnoremap <Space> :nohlsearch<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Quick exit from insert mode
inoremap jk <Esc>
