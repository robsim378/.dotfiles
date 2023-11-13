let &packpath = &runtimepath
set runtimepath^=~/.vim runtimepath+=~/.vim/after
source ~/.vimrc

call plug#begin(stdpath('data') . '/plugged')
Plug 'itchyny/lightline.vim'
Plug 'gkeep/iceberg-dark'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'oahlen/iceberg.nvim'
Plug 'junegunn/vim-slash'
Plug 'numToStr/Comment.nvim'
Plug 'itchyny/vim-cursorword'
Plug 'petertriho/nvim-scrollbar'
Plug 'lewis6991/gitsigns.nvim'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'gelguy/wilder.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'max397574/better-escape.nvim'

if has('nvim')
  function! UpdateRemotePlugins(...)
    " Needed to refresh runtime files
    let &rtp=&rtp
    UpdateRemotePlugins
  endfunction

  Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
else
  Plug 'gelguy/wilder.nvim'

  " To use Python remote plugin features in Vim, can be skipped
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

lua require('plugins')

" Lightline colorscheme
let g:lightline = { 'colorscheme': 'icebergDark' }

" Colorscheme setup
set background=dark
colorscheme iceberg

nnoremap <SPACE> <Nop>
let mapleader = " "
