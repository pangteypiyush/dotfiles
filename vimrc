"custom {{{ 
set number
set tabstop=8
set shiftwidth=8
set sts=8
set smarttab
set showmatch

set hlsearch
set incsearch

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
set foldcolumn=1
set foldmethod=marker

set showcmd
set ruler
set mouse=a

syntax enable

"for solarized theme
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
"}}}

"for indent_guide.vim{{{
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236
nnoremap <leader>k :IndentGuidesToggle<cr>
let g:indent_guides_start_level=2
"}}}
"set tags+=~/.vim/tags/c

"for tagbar.vim{{{
let g:tagbar_usearrows = 1
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
