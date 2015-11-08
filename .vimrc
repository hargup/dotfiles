"----[General]----------
"make Vim non compatible with Vi
set nocompatible

"use option (alt) as meta key on Mac
if has('macunix')
  set macmeta
endif

"use , over \ as leader
let mapleader = ","

"enable mouse use in all modes
set mouse=a

"recognise mouse for xterm type terminals
set ttymouse=xterm2

"do not display :intro at Vim start
set shortmess+=I

"always display status line
set laststatus=2


"----[Plug]----------
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'nanotech/jellybeans.vim'

Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'groenewege/vim-less',     { 'for': 'less' }
Plug 'vim-scripts/jQuery',      { 'for': 'javascript' }
Plug 'tpope/vim-markdown',      { 'for': 'markdown' }
Plug 'vim-ruby/vim-ruby',       { 'for': 'ruby' }
Plug 'othree/html5.vim',        { 'for': 'html' }
Plug 'keith/tmux.vim',          { 'for': 'tmux' }
Plug 'tpope/vim-git'
Plug 'mxw/vim-jsx',             { 'for': 'javascript.jsx'}

Plug 'xolox/vim-misc' | Plug 'xolox/vim-session'
Plug 'michaeljsmith/vim-indent-object'
Plug 'terryma/vim-multiple-cursors'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tomtom/quickfixsigns_vim'
Plug 'panozzaj/vim-autocorrect'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/syntastic'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'tpope/vim-endwise'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-repeat'
Plug 'kien/ctrlp.vim'
Plug 'sjl/gundo.vim'
call plug#end()


"----[Gvim]----------
"set the font
if has('macunix')
  set guifont=Monaco:h12
else  "linux
  set guifont=Droid\ Sans\ Mono\ 11
endif

"control guioptions
set guioptions=aivce

"set linespace
set linespace=1

"set antialising on
set antialias

"keybinding to reload vim (from xolox/vim-session)
nnoremap <D-r> :RestartVim<CR>


"----[Display]----------
"break lines longer than screen width
set wrap

"break lines at characters in 'breakat'
set linebreak

set background=light
colorscheme jellybeans

"do not update the display when running macros
set lazyredraw

"display as much of lastline as possible instead of a lot of @
set display=lastline

"alter the look and feel of the drop-down menu
:highlight Pmenu ctermbg=238 gui=bold


"----[Visual Hints]----------
" Highlight tabs and trailing whitespaces.
"
" Highlighting behavior is color scheme dependent. Solarized highlights tabs
" and trailing whitespaces using hl-CursorLine highlight group which makes
" them stand out, and at the same time are not very 'loud'.
set listchars=tab:\ \ ,trail:·

"display non-printable characters as configured in 'listchars' option
set list

"show (partial) command in status line
set showcmd

"show current mode down the bottom
set showmode

"show matching brackets.
set showmatch

"highlight the current line
set cursorline

"highlight current column
set cursorcolumn


"----[Browsing]----------
"search for tags file in the directory of the current file and upwards
set tags=./tags;

"create a window to the right of the current one on a vertical split
set splitright

"create a window below the current one on a horizontal split
set splitbelow

"jump to the first open window that contains the specified buffer; this works
"only for quickfix commands, and buffer related split commands
set switchbuf=usetab

"keep three lines above and below the cursor all the times
set scrolloff=3

"move through display lines with j and k (Vim's default is semantic jump)
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

"just scroll
map <Down> 2<C-e>
map <Up> 2<C-y>


"----[Searching and Substitution]----------
"do incremental and
set incsearch

"case insensitive search
set ignorecase

"unless query starts with a capital letter
set smartcase

"and highlight the search terms
set hlsearch

"assume 'g' flag for :substitute
set gdefault

"use <C-l> to clear the highlight of search hits
nnoremap <C-l> :nohls<CR>
inoremap <C-l> <C-O>:nohls<CR>


"----[Editing]----------
"number of spaces that a <Tab> counts for while editing (<Tab>, <BS>)
set softtabstop=2

"number of spaces that a <Tab> counts for
set tabstop=2

"expand tab into spaces
set expandtab

"number of spaces to use when (auto)indenting (=, <<, >>)
set shiftwidth=2

"round indent to a multiple of shiftwidth
set shiftround

"use shiftwidth when inserting <Tab> in front of a line
set smarttab

"smart autoindenting
set smartindent

"make Y consistent with C and D
nnoremap Y y$

"use system clipoard for yank, delete and paste operations
if has('macunix')
  set clipboard=unnamed
else "linux
  set clipboard=unnamedplus
endif

"toggle paste mode
set pastetoggle=<F10>

"re-select text block that was just pasted/edited
nnoremap <leader>gv `[v`]

"re-format paragraphs of text
nnoremap <leader>gq gqip

"do not leave visual mode after visually shifting text
vnoremap < <gv
vnoremap > >gv


"----[Buffer]----------
"don't use a swap or a backup file
set nobackup
set nowritebackup
set noswapfile

"hide a buffer when abnandoned, rather than unloading it
set hidden

"automatically read a file that has been changed externally
set autoread

"save the file when switching buffers or compile
set autowrite

"automatically save buffers when Vim looses focus
autocmd FocusLost * silent! wa

"enable undo persistence for all but tmp files
let g:undo_dir = $HOME . "/.vim/undo"
if !isdirectory(g:undo_dir)
    call mkdir(g:undo_dir)
endif
set undofile
let &undodir=g:undo_dir
autocmd BufWritePre /tmp/* setlocal noundofile
autocmd BufWritePre */.git/COMMIT_EDITMSG setlocal noundofile

"access undo tree
nnoremap <leader>u :GundoToggle<CR>


"----[Filetype]----------
"switch on filetype identification
filetype on

"enable builtin plugins for various filetypes
filetype plugin on

"enable builtin indenting scheme for various filetypes
filetype indent on

"switch on syntax highlighting
syntax on


"----[Completion]----------
"enable neocomplete on startup
let g:neocomplete#enable_at_startup = 1

"set keyword completion options
set complete=.,w,b,u,t,i,d,k,s

"set what to show in the popup menu
set completeopt=menu,longest,preview

"enable enhanced command line completion
set wildmenu

"using bash style
set wildmode=longest:full,full

"ignoring the following file patterns
set wildignore=*.o,*.obj,*~


"----[Abbreviations]----------
"expand %% to pwd on the command line
cabbr <expr> %% expand('%:p:h')


"----[Session]----------
"save viminfo to ~/.vim
set viminfo+=n~/.vim/viminfo

"web browser like sessions (using xolox/vim-session)
let g:session_autoload='yes'
let g:session_autosave='yes'
let g:session_autosave_silent=1
let g:session_autosave_periodic=1

"jump to the last position when reopening a file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"----[Syntastic]----------
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes = ['c', 'cpp']

"ignore modern HTML5 weirdness (Angular, Bootstrap, FontAwesome)
let g:syntastic_html_tidy_ignore_errors=[
      \" proprietary attribute \"ng-",
      \"<ng-include> is not recognized",
      \"discarding unexpected <ng-include>",
      \"discarding unexpected </ng-include>",
      \"trimming empty <i>",
      \"trimming empty <span>",
      \"<input> proprietary attribute \"autocomplete\"",
      \"proprietary attribute \"role\"",
      \"proprietary attribute \"am-time-ago\"",
      \"attribute \"tabindex\" has invalid value \"-1\""
      \]


"----[Fugitive]----------
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd FileType gitcommit setlocal spell


"----[JSX]---------------
let g:jsx_ext_required = 0


"----[CtrlP]-------------
let g:ctrlp_extensions = ['buffertag', 'quickfix', 'mixed']
nnoremap <leader>h :CtrlPMRUFiles<CR>
nnoremap <leader>t :CtrlPBufTag<CR>
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_map = '<leader>o'
