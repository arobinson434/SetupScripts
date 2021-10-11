#!/bin/bash 

cat > ~/.vimrc << EOF
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'sickill/vim-monokai'

call plug#end()

set expandtab    " expand tabs to spaces
set tabstop=4    " use 4 spaces per tab
set number       " show line numbers

syntax enable
colorscheme monokai

:imap jk <Esc>
map <C-n> :NERDTreeToggle<CR>
EOF
