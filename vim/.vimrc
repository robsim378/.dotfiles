" Enable filetype detection
filetype plugin indent on

" Use just one clipboard for the whole system
set clipboard=unnamedplus

" Wrap lines
set wrap

" Wrap lines only on linebreak
set linebreak 

" When wrapping lines, add an indent.
set breakindent


" ##### Visual Settings ##### {{{       

" Turn syntax highlighting on
syntax on

" Add line numbers
set relativenumber
set number

" Highlight cursor line
set cursorline

" Set shift width to 4 spaces
set shiftwidth=4

" Set tab width to 4 columns
set tabstop=4

" Always show at least 5 lines above and below the cursor when possible
set scrolloff=5

" Change the appearance of the current line highlighting
hi CursorLine cterm=NONE ctermbg=242
hi CursorLineNr cterm=NONE ctermbg=242
" }}}

" ##### Search Settings ##### {{{
" Incrementally highlight matching characters while searching
set incsearch

" Ignore capital letters during search
set ignorecase

" Ignore above option if searching for capital letters
set smartcase

" Highlight all search results
set hlsearch
" }}}



" ##### Fold Settings ##### {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" ##### Mappings ##### {{{
" Map Alt+j to <A-j>
map <Esc>j <A-j>
map <Esc>k <A-k>

" Map moving text up to alt+k and down to alt+j
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Make j and k respect wrapped lines
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
vnoremap j gj
vnoremap gj j
vnoremap k gk
vnoremap gk k

" }}}
