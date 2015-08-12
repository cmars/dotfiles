" Copyright © 2014 Casey Marshall <github@cmarstech.com>
" This work is free. You can redistribute it and/or modify it under the
" terms of the Do What The Fuck You Want To Public License, Version 2,
" as published by Sam Hocevar. See the COPYING file for more details.

set nocompatible               " be iMproved
set shortmess+=I               " be quiet
filetype off                   " required!

" disable gq double-spacing sentences in comments
set nojoinspaces

"vim use bash
set shell=/bin/bash

"let mapleader=","
set showcmd
map <Leader>n :NERDTree<cr>

" buffer magic
map <Leader>h :bp<cr>
map <Leader>l :bn<cr>

" window magic
noremap <C-Down> <C-W>j
noremap <C-Up> <C-W>k
noremap <C-Left> <C-W>h
noremap <C-Right> <C-W>l
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" tab indent with 4 spaces
set tabstop=4

" case insensitive searching, unless mixed case
set ignorecase
set smartcase

" colors
set t_Co=256
syntax on
colorscheme elflord

" Vundle
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Vundle bundles:
Bundle 'fholgado/minibufexpl.vim'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'L9'
Bundle 'fatih/vim-go'
Bundle 'dgryski/vim-godef'

filetype plugin on     " required!

let g:godef_split=0

