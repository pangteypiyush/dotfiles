"custom {{{ 
set nocompatible
set number
set clipboard=unnamed
set tabstop=8
set shiftwidth=8
set sts=8
set smarttab
set showmatch
set splitbelow
set splitright
"set matchpairs+=<:>
set incsearch
set hlsearch
set noswapfile
set nobackup
set nowritebackup
set autoread
set textwidth=80
set colorcolumn=+1
set ignorecase
set smartcase
set autoindent
set t_Co=256
set cursorline
set completeopt-=preview
set nocp

filetype indent on
filetype plugin on

set omnifunc=syntaxcomplete#Complete

"fold
set foldcolumn=2
set foldmethod=marker

set showcmd
set ruler
set mouse=a

syntax enable

"for solarized theme
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
"}}}u

"for indent_guide.vim{{{
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236
nnoremap <leader>k :IndentGuidesToggle<cr>
let g:indent_guides_start_level=2
"}}}

"for tagbar.vim{{{
let g:tagbar_usearrows = 1
let mapleader=" "
nnoremap <leader>l :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_show_linenumber = 1
"}}}

"for explore{{{
map <c-w>o :Vexplore ~<cr>
map <c-w>p :Vexplore<cr>
"}}}

"for enhancedCommentify{{{
let g:EnhCommentifyMultiPartBlocks = 'yes'
"}}}

"for doxygen{{{
let g:DoxygenToolkit_authorName="Piyush Pangtey"
"let g:DoxygenToolkit_briefTag_pre="@Synopsis"
"}}}

"for buffer traversal{{{
nnoremap <leader>o :bnext<cr>
nnoremap <leader>p :bprev<cr>
"}}}

"for tabpage{{{
nnoremap <leader>w :tabnew +Explore<cr>
nnoremap <leader>e :tabn<cr>
nnoremap <leader>q :tabp<cr>
"}}}

"tags to be loaded for java{{{
autocmd FileType java set tags=/home/fate/.vim/tags/java.tags"}}}

"tags for c {{{
autocmd FileType c set tags=/home/fate/.vim/tags/c.tags"}}}


"for airline{{{
set encoding=utf-8
set laststatus=2
let g:airline_theme='solarized'
let g:airline#extensions#tagbar#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#bufferline#enabled=1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_powerline_fonts=1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#tabline#left_alt_sep ="\ue0b1"
"let g:airline_section_y= 'BN: %{bufnr("%")}'
"if !exists('g:airline_symbols')
"	let g:airline_symbols = {}
"endif
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"}}}

"for gitgutter"{{{
let g:gitgutter_sign_column_always=1
let g:gitgutter_enabled=1
let g:gitgutter_signs=1
let g:gitgutter_highlight_lines=0"}}}
