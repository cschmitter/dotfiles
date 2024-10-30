" Basic and necessary
imap jk <esc>

nnoremap <space> <nop>
let mapleader = " "


" General
set number		" Show line numbers
set linebreak		" Break lines at word (requires Wrap lines)
set showbreak=\ -->\ \  " Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch		" Highlight matching brace
set virtualedit=all	" Enable free-range cursor
set visualbell	" Use visual bell (no beeping)

set hlsearch		" Highlight all search results
set smartcase		" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch		" Searches for strings incrementally

set smartindent	" Enable smart-indent
set smarttab		" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab

syntax enable

call plug#begin('~/.vim/plugged')
"Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
call plug#end()

"" Nerd Tree
nnoremap <leader>o :NERDTreeToggle<CR>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
	\ quit | endif
 




