" Map leader to ,
let mapleader = ","
let g:mapleader = ","

" Show line number
set number

" Make backspace work normally
set backspace=2

" Change buffers without saving
set hidden

" Set tab to 2 spaces
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

" Fix indenting
filetype indent on
set autoindent

" Better search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Remove swp files
set noswapfile

call plug#begin()
Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'w0rp/ale'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
call plug#end()

set termguicolors
colorscheme onedark

" NERDTree automatically open when vim starts up
autocmd vimenter * NERDTree
" NERDTree automatically open when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" NERDTree show hidden files
let NERDTreeShowHidden=1
" Map a specific key or shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>
" Map a specific key to search with fzf
map <LEADER>f :Files<CR>
" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'

let g:ale_javascript_prettier_use_local_config=1
let g:ale_fix_on_save = 1
let g:ale_cpp_clang_options = '-std=c++14'
let g:ale_fixers = {
            \   'javascript': ['prettier'],
            \   'css': ['prettier'],
            \   'c': ['clang-format'],
            \   'python': ['yapf', 'isort'],
            \   'c++': ['clang-format'],
            \   'sh': ['shfmt'],
            \   'haskell': ['hfmt']
            \}

let g:ale_linters = {
            \ 'go': ['gometalinter', 'gofmt'],
            \ 'cpp': [ 'clang', 'clangtidy', 'cppcheck', 'cpplint', 'gcc' ],
            \ 'javascript': ['eslint', 'flow','prettier'],
            \ 'css': ['stylelint', 'prettier'],
            \ 'python': ['pycodestyle', 'flake8'],
            \ 'graphql': ['prettier', 'eslint'],
            \}

  noremap <C-l> :tabnext<CR>|                       " next tab in normal mode
  noremap <C-h> :tabprevious<CR>|                   " prev tab in normal mode
  noremap <C-t> :tabnew<CR>|                        " new tab in normal mode
