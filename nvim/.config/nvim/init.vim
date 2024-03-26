let &packpath = &runtimepath
set runtimepath^=~/.vim runtimepath+=~/.vim/after
source ~/.vimrc

call plug#begin(stdpath('data') . '/plugged')

" ROS and ROS2
Plug 'tadachs/ros-nvim'
" Latex stuff
Plug 'lervag/vimtex'
" Status line
Plug 'itchyny/lightline.vim'
" Colorscheme
Plug 'gkeep/iceberg-dark'
Plug 'oahlen/iceberg.nvim'
Plug 'srcery-colors/srcery-vim'
Plug 'sainnhe/gruvbox-material'
Plug 'davidosomething/vim-colors-meh'
Plug 'loctvl842/monokai-pro.nvim'
Plug 'sainnhe/sonokai'
Plug 'danilo-augusto/vim-afterglow'
Plug 'luisiacc/gruvbox-baby'
Plug 'ellisonleao/gruvbox.nvim'
" Indentation lines
Plug 'lukas-reineke/indent-blankline.nvim'
" Dependency of something I think
Plug 'junegunn/vim-slash'
" Quickly comment lines
Plug 'numToStr/Comment.nvim'
" Underline the word under the cursor
Plug 'itchyny/vim-cursorword'
" Scrollbar
Plug 'petertriho/nvim-scrollbar'
" Git decorations, look into this: It may be be able to replace inline git blame
Plug 'lewis6991/gitsigns.nvim'
" Not sure what this does, might be a depencency for something else
Plug 'kevinhwang91/nvim-hlslens'
" Also not entirely sure why I have this, might be a dependency
Plug 'gelguy/wilder.nvim'
" Better error formatting
Plug 'folke/trouble.nvim'
" CMP
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Snippets
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'} 
Plug 'rafamadriz/friendly-snippets'
Plug 'saadparwaiz1/cmp_luasnip'
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
" Git blame inline
Plug 'tveskag/nvim-blame-line'
" Autopair brackets and such
Plug 'windwp/nvim-autopairs'
" Provides icons that some other plugins use
Plug 'nvim-tree/nvim-web-devicons'
" File explorer tree
Plug 'nvim-tree/nvim-tree.lua'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Dependency for a bunch of stuff
Plug 'nvim-lua/plenary.nvim'
" AI code completion
Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }
" Telescope fuzzy finder
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
" jj = esc 
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

set encoding=utf-8


filetype plugin on

" Enable git blame line
autocmd BufEnter * EnableBlameLine
let g:blameLineVirtualTextFormat = '		%s'

set pumheight=10

" Lightline colorscheme
let g:lightline = { 'colorscheme': 'icebergDark' }

" Colorscheme setup
set background=dark
colorscheme iceberg

nnoremap <SPACE> <Nop>
let mapleader = " "
