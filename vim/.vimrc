let mapleader = ","
let g:mapleader = ","

"Automatically change the current directory
autocmd BufEnter * silent! lcd %:p:h

set number

set backspace=2

set hidden

set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

filetype indent on
set autoindent

set hlsearch
set incsearch
set ignorecase
set smartcase

set noswapfile

call plug#begin()
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'w0rp/ale'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'soli/prolog-vim'
call plug#end()

set termguicolors
colorscheme onedark

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
            \   'haskell': ['hfmt'],
            \   'prolog': ['swipl']
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

au FileType perl set filetype=prolog

" Autoclose brackets
""inoremap " ""<left>
""inoremap ' ''<left>
""inoremap ( ()<left>
""inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
