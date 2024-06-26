" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
endif
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=longest:list:full
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"
" ================ Scrolling ========================

set scrolloff=5         "Start scrolling when we're 5 lines away from margins
set sidescrolloff=10
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" =========================================================
" ================ Custom Settings ========================
" =========================================================
so ~/.yadr/vim/settings.vim

" =============== Styling ==========
syntax enable
set background=dark
colorscheme gruvbox

nnoremap ; :

set cursorline

" Define font and size of window
set guifont=Monospace\ 10
"set lines=40
"set columns=150

" NERDTree settings
let NERDTreeShowBookmarks=1
let g:nerdtree_tabs_open_on_gui_startup=0

" CtrlP settings
let g:ctrlp_working_path_mode = 'a' " Search within cwd
" line - search within files
let g:ctrlp_extensions = ['line']
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" SuperTab settings
let g:SuperTabDefaultCompletionType = "<c-n>"

" Vim auto save settings
autocmd CursorHold * silent update

" Disable INSERT mode for readonly files
autocmd BufReadPost * if &readonly | setlocal nomodifiable | endif

" Syntastic file checker settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['standard']

" Search for closest tags file
set tags=./tags,tags;$HOME
let g:easytags_async=1
let g:easytags_auto_highlight=0

" ALE Linter
let g:ale_fixers = ['eslint', 'prettier']
let g:ale_fix_on_save = 1

" SnipMate
let g:snipMate = { 'snippet_version' : 1 }

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Mappings for git
nnoremap <leader>gst :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gbl :Gblame<CR>
nnoremap <leader>ghp <Plug>(GitGutterPreviewHunk)
nnoremap <leader>ghs <Plug>(GitGutterStageHunk)
nnoremap <leader>ghu <Plug>(GitGutterUndoHunk)

" Show indent guides
au VimEnter * IndentGuidesEnable

" Start Tagbar
" Disable Tagbar auto open for now
"au VimEnter,TabEnter * TagbarOpen

" If file is `*.java`
"au Filetype java setlocal omnifunc=javacomplete#Complete

" Auto highlight word under cursor
"call AutoHighlightToggle()
