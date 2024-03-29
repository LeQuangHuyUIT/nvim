if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'morhetz/gruvbox'

    Plug 'https://github.com/tomasr/molokai'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

call plug#end()
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set ft=nasm
let g:molokai_original = 1
autocmd filetype cpp nnoremap <C-C> :w <bar> !g++ -std=c++14 % -o %:r -W<CR>
nnoremap <C-s> :w <CR>
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
