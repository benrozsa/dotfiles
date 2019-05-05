set number
set wildmenu
set showcmd
set nocompatible
set autoindent
set expandtab
set background=dark
set backspace=indent,eol,start
set textwidth=79
set tabstop=8
set wrapmargin=8
set softtabstop=4
set shiftwidth=4
set encoding=utf-8
set completeopt-=preview
syntax on
let g:pymode_python = 'python3'

filetype plugin indent on

au FileType python noremap <buffer> <F8> :call Autopep8()
au FileType python setlocal formatprg=autopep8\ -
let g:pymode = 1
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 0

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = 'b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 1
