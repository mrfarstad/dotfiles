" ****************
" * Key bindings *
" ****************
let mapleader = ","
let g:mapleader = ","
let g:mapleader = ","

"noremap <C-w> :!python3 plot_stencil_depths.py<CR> noremap <C-s> :!for i in $(seq 0 13); do python3 plot_stencil_depths.py $i; done<CR>
"noremap <C-x> :!bash copy_results.sh<CR>

" m (used for marking) when using vim-easyclip
nnoremap gm m
  
" keep original d-button functionality (before vim-cutlass)
nnoremap d d
xnoremap d d
nnoremap dd dd


nnoremap D D

" ***********
" * General *
" ***********
set number                " Show line numbers
set hidden                " Edit multiple buffers without saving the modifications made to a buffer while loading other buffers
set noswapfile            " No swap files

set hlsearch              " Highlight all search results
set ignorecase            " Ignore case on search
set autoindent            " Autoindent on new line
set expandtab             " Use spaces, not tabs
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab " Set tab to 4 spaces
set scrolloff=3           " Display 3 lines around cursor
set incsearch             " Enable incremental search
set clipboard=unnamed     " Use system clipboard


set scrolloff=3           " Display 3 lines around cursor
set noshowmode            " Remove -- INSERT -- from status bar
"set updatetime=100        " If this many milliseconds nothing is typed the swap file will be written to disk (Useful for Ale)
set ttimeoutlen=0        " Quick normal / instert toggle

filetype indent plugin on " Fix indenting

set hlsearch              " Highlight all matches
set incsearch             " Incrementally show matched pattern when searching
set ignorecase            " Ignore case.
set smartcase             " Do not ignore case if search contains uppercase letter

set comments+=b:-   " Add bullets automatically
set formatoptions+=ro


" Spellcheck
augroup text_langs
  autocmd!
  autocmd FileType tex,text,markdown setlocal spell
  autocmd FileType tex,text,markdown setlocal spelllang=nb,en_us
augroup end

call plug#begin()
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-rooter'
Plug 'dense-analysis/ale'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'soli/prolog-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'svermeulen/vim-cutlass'
Plug 'dkarter/bullets.vim'
Plug 'preservim/nerdtree'
Plug 'lervag/vimtex'
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }
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
            \   'python': ['black'],
            \   'c++': ['clang-format'],
            \   'sh': ['shfmt'],
            \   'haskell': ['hfmt'],
            \   'prolog': ['swipl'],
            \}

let g:ale_linters = {
            \ 'go': ['gometalinter', 'gofmt'],
            \ 'cpp': [ 'clang', 'clangtidy', 'cppcheck', 'cpplint', 'gcc' ],
            \ 'javascript': ['eslint', 'flow','prettier'],
            \ 'css': ['stylelint', 'prettier'],
            \ 'python': ['pycodestyle', 'flake8', 'jedi'],
            \ 'graphql': ['prettier', 'eslint'],
            \}

let g:PyFlakeOnWrite = 1

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

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" *************
" * EasyAlign *
" *************
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" EasyAlign Custom Rules
" See https://github.com/junegunn/vim-easy-align#extending-alignment-rules
let g:easy_align_delimiters = {
\ '\': {
\     'pattern':         '\\' },
\ '/': {
\     'pattern':         '//\+\|/\*\|\*/',
\     'delimiter_align': 'l',
\     'ignore_groups':   ['!Comment'] },
\ }

"*****************************
"* Configure fzf (+ ripgrep) *
"*****************************
function! Custom_files()
  if isdirectory(".git")
    :GFiles --cached --others
  else
    :Files
  endif
endfunction

nnoremap <C-p> :call Custom_files()<CR>
nnoremap <C-O> :Buffers<CR>
nnoremap <C-f> :Rg<CR>
nnoremap <C-n> :noh<CR>

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.{.git,node_modules,venv}/*"'

" Terminal buffer options for fzf
autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu


" Bullets.vim
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]

let g:bullets_outline_levels = ['num', 'abc', 'std*']

"*********************
"* Configure nerdtree
"*********************

nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-s> :NERDTreeFind<CR>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Prevent vim -c ":call Custom_files()" from opening in NERDTree
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

