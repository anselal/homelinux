"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle/') " you can ommit the path

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" utilities
"Plugin 'tmhedberg/SimpylFold'
"Plugin 'vim-scripts/indentpython.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'kien/ctrlp.vim' " fuzzy find files
Plugin 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle
Plugin 'tpope/vim-fugitive' " the ultimate git helper
Plugin 'vim-syntastic/syntastic'

" colorschemes
" Manually installed in ~/.vim/colors to get rid of .git overhead
"Plugin 'jnurmine/Zenburn'
"Plugin 'altercation/vim-colors-solarized'

" Python plugins
Plugin 'nvie/vim-flake8'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set autoread " detect when a file is changed

" make backspace behave in a sane manner
set backspace=indent,eol,start

" set a map leader for more key combos
let mapleader = ','

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Tab shortcuts
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap td :closetab<CR>

" specify different areas of the screen where the splits should occur by default
set splitbelow
set splitright

" split navigations
nnoremap <C-J> <C-W><C-J> " Ctrl-j move to the split below
nnoremap <C-K> <C-W><C-K> " Ctrl-k move to the split above
nnoremap <C-L> <C-W><C-L> " Ctrl-l move to the split to the right
nnoremap <C-H> <C-W><C-H> " Ctrl-m move to the split to the left

" faster redrawing
set ttyfast

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

" Enable syntax, make code look pretty
syntax on
let python_highlight_all=1

" Show line numbers
set number

" Encoding
set encoding=utf-8

" PEP8 Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Full Stack Indentation
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

set laststatus=2 " show the status line all the time

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>ev :e! ~/.vimrc<cr> " edit ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

" Auto-complete customizations
" ensures that the autocomplete window goes away when
" you’re done with it
"let g:ycm_autoclose_preview_window_after_completion=1
" shortcut for goto definition
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Syntax Checking/Highlighting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
