set showmode
set ignorecase smartcase
set number
set ruler
set showcmd
set hlsearch
set incsearch
set shiftwidth=4
set autoindent
set softtabstop=4
set tabstop=4
set mouse=a
set cursorcolumn
set cursorline

syntax on
filetype plugin indent on

set rtp +=~/.config/nvim
set rtp +=~/.vim
call plug#begin()
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'preservim/nerdtree'
call plug#end()

" html字体背景颜色
iab htmlpwuq <font style="background:"></font><Left><Left><Left><Left><Left><Left><Left><Left><Left>
" html字体文字颜色
iab htmlpwyq <font color=""></font><Left><Left><Left><Left><Left><Left><Left><Left><Left>
" html段落
iab ppp <p></p><Left><Left><Left><Left>
" html删除线
iab htmldel <del></del><Left><Left><Left><Left><Left><Left>

noremap kj <Esc>
noremap! kj <Esc>
nnoremap <Space>h gT
nnoremap <Space>l gT
