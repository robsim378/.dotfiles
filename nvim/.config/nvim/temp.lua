vim.cmd([[
source ~/.vimrc
]])

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/config/nvim/plugged')

-- Colorschemes
Plug 'gkeep/iceberg-dark'
Plug 'srcery-colors/srcery-vim'

Plug 'itchyny/lightline.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'oahlen/iceberg.nvim'
Plug 'junegunn/vim-slash'
Plug 'numToStr/Comment.nvim'
Plug 'itchyny/vim-cursorword'
Plug 'petertriho/nvim-scrollbar'
Plug 'lewis6991/gitsigns.nvim'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'gelguy/wilder.nvim'

 
vim.call('plug#end')

local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})

require("scrollbar").setup()

require("Scrollbar.handlers.search").setup({
	override_lens = function() end,
})

require('gitsigns').setup()

require('hlslens').setup()


vim.cmd([[
leg g:lightline = { 'colorscheme': 'icebergDark' }
set background=dark
colorscheme iceberg
]])
