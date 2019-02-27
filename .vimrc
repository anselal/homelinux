" General
set number              " Show line numbers
set relativenumber      " Show relative line numbers
set lazyredraw
set regexpengine=1      " use old engine (makes relativenumber faster)
set linebreak           " Break lines at word (requires Wrap lines)
set showbreak=+++       " Wrap-broken line prefix
set textwidth=100       " Line wrap (number of cols)
set showmatch           " Highlight matching brace
" set spell               " Enable spell-checking
" set errorbells          " Beep or flash screen on errors
" set visualbell          " Use visual bell (no beeping)

set hlsearch            " Highlight all search results
set smartcase           " Enable smart-case search
set gdefault            " Always substitute all matches in a line
set ignorecase          " Always case-insensitive
set incsearch           " Searches for strings incrementally

set autoindent          " Auto-indent new lines
set cindent             " Use 'C' style program indenting
set expandtab           " Use spaces instead of tabs
set shiftwidth=4        " Number of auto-indent spaces
set smartindent         " Enable smart-indent
set smarttab            " Enable smart-tabs
set softtabstop=4       " Number of spaces per Tab

" Advanced
set confirm             " Prompt confirmation dialogs
set ruler               " Show row and column ruler information
set showtabline=2       " Show tab bar

set undolevels=1000     " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour

" Generated by VimConfig.com

" specify different areas of the screen where the splits should occur by default
set splitbelow
set splitright

" split navigations
nnoremap <C-J> <C-W><C-J> " Ctrl-j move to the split below
nnoremap <C-K> <C-W><C-K> " Ctrl-k move to the split above
nnoremap <C-L> <C-W><C-L> " Ctrl-l move to the split to the right
nnoremap <C-H> <C-W><C-H> " Ctrl-m move to the split to the left

" Tab shortcuts
nnoremap <C-t> :tabnew<CR>
nnoremap <C-w> :tabclose<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

syntax on
set t_Co=256
set mouse=a             " Enable mouse support
colorscheme wombat256mod
