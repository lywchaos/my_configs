set showmode
set ignorecase
set number
set ruler
set showcmd
set nohlsearch
set autoindent
set softtabstop=4
set rtp +=~/.vim

syntax on
filetype plugin indent on

call plug#begin()
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'preservim/nerdtree'
call plug#end()

" html字体背景颜色
:iab htmlpwuq <font style="background:"></font><Left><Left><Left><Left><Left><Left><Left><Left><Left>
" html字体文字颜色
:iab htmlpwuq <font color=""></font><Left><Left><Left><Left><Left><Left><Left><Left><Left>
