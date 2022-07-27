
set rtp +=~/.vim
call plug#begin('~/.vim/plugged')

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

call plug#end()

set nohlsearch
set autoindent
set showmode
set showcmd
set softtabstop=4
syntax on
filetype plugin indent on

" html字体背景颜色
:iab htmlpwuq <font style="background:"></font><Left><Left><Left><Left><Left><Left><Left><Left><Left>
" html字体文字颜色
:iab htmlpwuq <font color=""></font><Left><Left><Left><Left><Left><Left><Left><Left><Left>
