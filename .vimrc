"       _                    
"__   _(_)_ __ ___  _ __ ___ 
"\ \ / / | '_ ` _ \| '__/ __|
" \ V /| | | | | | | | | (__ 
"(_)_/ |_|_| |_| |_|_|  \___|
"

" To manage plugins use the following commands
" 	:PlugInstall
" 	:PlugUpdate
" 	:PlugClean

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'LukeSmithXYZ/vimling'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Basic settings here. 
syntax on
    set encoding=utf-8
    set number 
    set showcmd
    set incsearch
    set hlsearch

" Highlight past column 80
    let &colorcolumn=join(range(80,80),",")
    highlight ColorColumn ctermbg=Black guibg=#3b4252

"      *cterm-colors*

" NR-16   NR-8    COLOR NAME 
" 0       0       Black
" 1       4       DarkBlue
" 2       2       DarkGreen
" 3       6       DarkCyan
" 4       1       DarkRed
" 5       5       DarkMagenta
" 6       3       Brown, DarkYellow
" 7       7       LightGray, LightGrey, Gray, Grey
" 8       0*      DarkGray, DarkGrey
" 9       4*      Blue, LightBlue
" 10      2*      Green, LightGreen
" 11      6*      Cyan, LightCyan
" 12      1*      Red, LightRed
" 13      5*      Magenta, LightMagenta
" 14      3*      Yellow, LightYellow
" 15      7*      White
 
" Enable autocompletion
	set wildmode=longest,list,full

" Map Space+g to toggle Goyo
    map <leader>g :Goyo \| :call ToggleProse() \| <CR>

" Map Leader+l to toggle Latex Live Preview
    map <leader>l :LLPStartPreview <CR>

" Map Leader+p to prettify in haskell
   map <leader>p :%!stylish-haskell <CR>

" Map Leader+o to toggle Spellcheck
    map <leader>o :setlocal spell! spelllang=en_us<CR>
    map <leader>s :set spelllang=es<CR>

" Map keys for Deadkeys, IPA, and Prose modes
    map <leader>d :call ToggleDeadKeys() <CR>
    map <leader>i :call ToggleIPA() <CR>
"   map <leader>p :call ToggleProse() <CR>

" Set the splits to open below or to the right
    set splitbelow splitright

" Shortcut split navigation to save unnecessary 'w' keypress
    map <S-h> <C-w>h
    map <S-j> <C-w>j
    map <S-k> <C-w>k
    map <S-l> <C-w>l
    map <C-H> <C-w>H
    map <C-J> <C-w>J
    map <C-K> <C-w>K
    map <C-L> <C-w>L

" Map escape to jk  
    inoremap jk <Esc>

" Set airline theme
    let g:airline_theme='bubblegum'
    set guifont=Liberation\ Mono\ for\ Powerline\ 10
    let g:airline_powerline_fonts = 1
    let g:airline_section_x      = '%Y'     
    let g:airline_section_y      = ''    
    let g:airline_section_z      = '' "'%{WordCount()} words'   
    let g:airline_section_warning = '%l / %L' 
    
"   let g:airline_section_a       (mode, crypt, paste, spell, iminsert)
"   let g:airline_section_b       (hunks, branch)[*]
"   let g:airline_section_c       (bufferline or filename)
"   let g:airline_section_gutter  (readonly, csv)
"   let g:airline_section_x       (tagbar, filetype, virtualenv)
"   let g:airline_section_y       (fileencoding, fileformat)
"   let g:airline_section_z       (percentage, line number, column number)
"   
"   let g:airline_section_error   (ycm_error_count, syntastic-err, eclim,
"                                 languageclient_error_count)
"   let g:airline_section_warning (ycm_warning_count, syntastic-warn,
"                                 languageclient_warning_count, whitespace)

" ALE linting tool settings
    map <leader>a :ALEToggle <CR>
    let g:ale_sign_error = '~>'
    let g:ale_sign_warning = '~~'
    highlight SignColumn ctermbg=0
    highlight ALEError ctermbg=2
    highlight ALEErrorSign ctermbg=2
    highlight ALEWarning ctermbg=3
    highlight ALEWarningSign ctermbg=3

" Search settings
	set incsearch
	set hlsearch

" Tab settings
	set expandtab
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	retab

" Latex live preview settings
    let g:livepreview_previewer = 'zathura'

" Clipboard Settings
    set clipboard=unnamedplus

" Functions
" Word Count
function! WordCount()
   let s:old_status = v:statusmsg
   let position = getpos(".")
   exe ":silent normal g\<c-g>"
   let stat = v:statusmsg
   let s:word_count = 0
   if stat != '--No lines in buffer--'
     let s:word_count = str2nr(split(v:statusmsg)[11])
     let v:statusmsg = s:old_status
   end
   call setpos('.', position)
   return s:word_count
endfunction
