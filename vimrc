" Custom Core {{{ 
" set your terminal to have atleast 89 columns.
set encoding=utf-8
set nocompatible
set clipboard=unnamedplus
set tabstop=8
set shiftwidth=8
set sts=8
set smarttab
set showmatch
set splitbelow
" HTML editing Shit
"set matchpairs+=<:>
set incsearch
set hlsearch
set noswapfile
set nobackup
set nowritebackup
set autoread
" set textwidth=80
" set colorcolumn=+1
set colorcolumn=81
set ignorecase
set smartcase
set autoindent
set t_Co=256
set cursorline
set completeopt-=preview
"let mapleader=" "
set hidden "allow buffer change even if changes were made
filetype indent on
filetype plugin on
hi VertSplit guibg=NONE ctermfg=166
set fillchars+=vert:│

"fold
set foldcolumn=2
set foldmethod=marker

set pastetoggle=<F2>
set showcmd
set ruler
set mouse=a

set omnifunc=syntaxcomplete#Complete
syntax enable

"for solarized theme
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

"for clearing last search string
" command C let @/=""
nnoremap <leader>cl :let @/=""<cr>

"for clipboard //gvim stuff (ABS arch)
" vmap <C-c> "+yi
" vmap <C-x> "+c
" vmap <C-v> c<ESC>"+p
" imap <C-v> <C-r><C-o>+
"}}}

"{{{ Vundle
set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
call vundle#begin('~/.vim/bundle/plugins')
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/syntastic'
Plugin 'thinca/vim-ref'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/ctrlp.vim'
Plugin 'qpkorr/vim-bufkill'
Plugin 'nathanaelkane/vim-indent-guides'
call vundle#end()
"}}}

"{{{ Relative <-> Absolute row numbering
set rnu
set nu " always show cursor's line no. (!0)
function ToggleNumbersOn()	
	set rnu!
endfunction
function ToggleRelativeOn()
	set rnu
endfunction
autocmd FocusLost * call ToggleNumbersOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleNumbersOn()
autocmd InsertLeave * call ToggleRelativeOn()
"}}}

"IndentGuide{{{
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236
nnoremap <leader>k :IndentGuidesToggle<cr>
let g:indent_guides_start_level=2
"}}}

"Tagbar{{{
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>
"let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_show_linenumbers = 3
"slow startup while openeing heavy file
"autocmd FileType c,cpp,vim,java,php,js nested :TagbarOpen
let g:tagbar_autopreview = 0 "moody
"}}}

"Explore{{{
"map <c-w>o :Vexplore ~<cr>
"map <c-w>p :Vexplore<cr>
let g:netrw_banner=0
let g:netrw_browse_split=3 "earlier i used 2
let g:netrw_hide=1
let g:netrw_winsize=20
"autocmd FileType c,cpp,vim,java,html,php,js :Vexplore 
"}}}

"EnhancedCommentify{{{
let g:EnhCommentifyMultiPartBlocks = 'yes'
let g:EnhCommentifyIgnoreWS = 'no'
let g:EnhCommentifyPretty = 'yes'
let g:EnhCommentifyUseSyntax = 'yes'
let g:EnhCommentifyCommentsOp = 'yes'  "EXPERIMENTAL
"}}}

"DoxygenToolkit{{{
let g:DoxygenToolkit_authorName="Piyush Pangtey"
"let g:DoxygenToolkit_briefTag_pre="@Synopsis"
"}}}

"Buffer Navigation{{{
nnoremap <leader>] :bnext<cr>
nnoremap <leader>p :bd<cr>
nnoremap <leader>[ :bprev<cr>
"}}}

"Tabpage{{{
nnoremap <leader>w :tabnew <cr>
"+Explore<cr>
nnoremap <leader>' :tabn<cr>
nnoremap <leader>; :tabp<cr>
"}}}

"Tags{{{
" autocmd FileType java set tags=~/.vim/tags/java.tags
" autocmd FileType c set tags=~/.vim/tags/c.tags
"}}}

"Airline{{{
set encoding=utf-8
set laststatus=2
let g:airline_theme='murmur'
"old theme tommorow
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

"GitGutter"{{{
let g:gitgutter_enabled=1
let g:gitgutter_signs=1
let g:gitgutter_sign_column_always=1
let g:gitgutter_highlight_lines=0
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
nmap <leader>hs <Plug>GitGutterStageHunk
nmap <leader>hr <Plug>GitGutterRevertHunk
nmap <leader>hv <Plug>GitGutterPreviewHunk
nmap <leader>hn <Plug>GitGutterNextHunk
nmap <leader>hp <Plug>GitGutterPrevHunk
"}}}

"Clear Registers"{{{
function! ClearRegisters()
	redir => l:register_out
	silent register
	redir end
	let l:register_list = split(l:register_out, '\n')
	call remove(l:register_list, 0) " remove header (-- Registers --)
	call map(l:register_list, "substitute(v:val, '^.\\(.\\).*', '\\1', '')")
	call filter(l:register_list, 'v:val !~ "[%#=.:]"') " skip readonly registers
	for elem in l:register_list
		execute 'let @'.elem.'= ""'
	endfor
endfunction
"}}}

"NERDTree{{{
let NERDTreeQuitOnOpen=0
let NERDTreeShowLineNumbers=1
let NERDTreeMinimalUI=1
nnoremap <leader>t :NERDTreeFind<CR>
nnoremap <leader>g :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"}}}

"{{{ Indents
autocmd FileType php,html,css,javascript,xml set tabstop=2
autocmd FileType php,html,css,javascript,xml set shiftwidth=2
"}}}

"{{{ Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
nnoremap <leader>D :Errors<cr>
" }}}

"{{{ Make this a habbit.
map <Left>  :echoe "h"<CR>
map <Right> :echoe "l"<CR>
map <Up>    :echoe "k"<CR>
map <Down>  :echoe "j"<CR>
"}}}
