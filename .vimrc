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


"----[Pathogen]----------
filetype off
execute pathogen#infect()


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

"setup filer
let g:vimfiler_as_default_explorer=1
nnoremap <leader>p :VimFilerExplorer<CR>

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
"Highlight tabs and trailing whitespaces.  Additionally, display a '·' for
"each trailing whitespace.
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

"move through tabs
nnoremap <C-t>     :tabnew<CR>
nnoremap <C-Tab>   :tabnext<CR>
nnoremap <C-S-Tab> :tabprev<CR>

"move through display lines with j and k (Vim's default is semantic jump)
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

"just scroll
map <Down> 2<C-e>
map <Up> 2<C-y>

" Unite settings and mappings
let g:unite_enable_start_insert = 1
let g:unite_enable_split_vertically = 1
let g:unite_kind_file_vertical_preview = 1
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec/async', 'sorters', 'sorter_rank')

nnoremap <leader>o :<C-u>Unite -buffer-name=files buffer neomru/file file_rec/async<CR>
nnoremap <leader>y :<C-u>Unite history/yank<CR>
nnoremap <leader>f :<C-u>Unite outline<CR>
nnoremap <leader>s :<C-u>Unite session<CR>
nnoremap <leader>c :<C-u>Unite -horizontal -direction=botright -buffer-name=unite_commands command mapping<CR>
"doesn't seem to work
"nnoremap <leader>t :<C-u>Unite tag<CR>

let g:unite_source_history_yank_enable = 1
nnoremap <leader>y :<C-u>Unite history/yank<CR>

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
nmap Y y$

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

"set omnicompletion for Ruby, Eruby and Rails
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

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

let g:unite_source_session_enable_auto_save=1
let g:unite_source_session_options="folds,tabpages,winsize"

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


"----[snipmate]----------
let g:snips_author = "Anurag Priyam"


"----[AutoClose]----------
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}', '`': '`'}
let g:AutoCloseProtectedRegions = ["Character"]


"----[Fugitive]----------
autocmd BufReadPost fugitive://* set bufhidden=delete


"----[Splitjoin]----------
nnoremap <leader>sj :SplitjoinJoin<CR>
nnoremap <leader>ss :SplitjoinSplit<CR>

"----[Vimshell]----------
"nnoremap <leader>r :VimShellInteractive irb
"nnoremap <leader>rs :'<,'>VimShellSendString
