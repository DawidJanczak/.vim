" ==================================================
" ===== General options ============================
" ==================================================

call plug#begin('~/.vim/plugged')

Plug 'jeetsukumaran/vim-buffergator'
Plug 'vim-scripts/IndexedSearch'
Plug 'scrooloose/nerdcommenter'
" Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'roman/golden-ratio'
Plug 'vim-scripts/L9'
Plug 'altercation/vim-colors-solarized'
Plug 'godlygeek/tabular'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-rails'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-ragtag'
Plug 'puppetlabs/puppet-syntax-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-repeat'
Plug 'suan/vim-instant-markdown'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'mtscout6/vim-cjsx'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'elmcast/elm-vim'
Plug 'fatih/vim-go'
Plug 'jremmen/vim-ripgrep'
Plug 'slim-template/vim-slim'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
" Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'SirVer/ultisnips'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
" Plug 'doums/coBra'
Plug 'sheerun/vim-polyglot'
Plug 'cocopon/iceberg.vim'
" Plug 'morhetz/gruvbox'
Plug 'tpope/vim-abolish'
Plug 'ap/vim-css-color'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-liquid'

call plug#end()

" Colorscheme used plus syntax highlighting
syntax on
set background=dark
colorscheme iceberg

" Disabing modelines (security)
set nomodeline

" Tabs mapped to 2 space characters (Ruby default)
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Encoding
set encoding=utf-8

" When searching for a string in file always scroll so that 3 lines before and after result are visible
set scrolloff=3

" Remember indent after going to the next line
set autoindent

" Show current mode (e.g. input, visual)
set showmode

" Show command that is being entered in the lower right
set showcmd

" Allow switching between buffers when there are changes made and buffers are not saved
set hidden

" Show available commands when tab is pressed
set wildmenu

" Show the commands as a list of all available commands
set wildmode=list:longest

" Show screen blink instead of a beep when command cannot be executed
set visualbell

" Indicate currently edited line
set cursorline

" Faster scrolling
set ttyfast

" Show cursor position in lower right
set ruler

" Allow extended backspace behaviour
set backspace=indent,eol,start

" Always show the status line
set laststatus=2

" Line numbers relative to current line
set relativenumber
set number

" Map leader key to ','
let mapleader = ","
nmap \ ,

" Yanking and cutting to * registry
set clipboard=unnamed

" Save swap files elsewhere
set backupdir=~/tmp//
set directory=~/tmp//

" Configure tags location
set tags+=./tags,tags;
set tags+=./gems.tags,gems.tags;

" Settings below taken from https://github.com/neoclide/coc.nvim#example-vim-configuration

" Increase cmd height
set cmdheight=2

" Update swap more often
set updatetime=300

" Don't show ins-completion-menu
set shortmess+=c

" ==================================================
" ===== Search/replace section =====================
" ==================================================

" Automatically add \v when searching so that regexp acts more like in perl
nnoremap / /\v
vnoremap / /\v

" Ignore case while searching
set ignorecase

" Smartcase search with ignorecase on causes vim to:
" - ignore case is on when only lower letters are used
" - ignore case is off when at least one upper case letter is present in the word
set smartcase

" Setting gdefault causes automatic \g flag addition when replacing. this means that all occurences in the file will be replaced.
set gdefault

" Incremental search means the search will be performed and refined after every key input, not after hitting enter.
set incsearch

" Highlights matching brace
set showmatch

" Highlights serach results
set hlsearch

" , + space can be used to clear search results.
nnoremap <leader><space> :noh<cr>

" Set wrap for longer lines
set wrap

" Ignore some directories
set wildignore+=*/tmp/*,*/node_modules/*,*.elmi,*.elmo

" Disable screen blinking
set t_vb=

" ==================================================
" ===== Misc key mappings ==========================
" ==================================================

" Some additional mappings:
" 1. j and k work on visible lines instead of actual lines (helpful when sentence is wrapped)
" 2. disable f1 key

nnoremap j gj
nnoremap k gk
inoremap <f1> <esc>
nnoremap <f1> <esc>
vnoremap <f1> <esc>

" Use space to switch to previously edited buffer
nnoremap <space> :b#<cr>

" Y to behave like D - yank till EOL
nnoremap Y y$

" w!! writes files with root privileges
cmap w!! %!sudo tee > /dev/null %

" Save with :W
command! W update

" Map :Q to :q
map Q <Nop>

" Find and replace where . will repeat substitution
nnoremap <leader>x *``cgn

" Auto close {
inoremap {{ {{<space><space>}}<left><left><left>
inoremap { {<space><space>}<left><left>

" ==================================================
" ===== Leader commands ============================
" ==================================================

" Leader w removes all trailing spaces in a file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" Folding tags
nnoremap <leader>ft vatzf

" Open .vimrc in splitted window
nnoremap <leader>ev :tabe $MYVIMRC<cr>

" Go from insert mode to normal mode with jj
inoremap jj <esc>

" Open a new vertically split window and move to it
nnoremap <leader>w <c-w>v<c-w>l

" Mappings for switching active split window
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <C-tab> gT

" Mappings for inserting a line before/after current one without going into insert mode and without going to new line.
nnoremap <leader>o o<esc>
nnoremap <leader>o o<esc>

" ctrl+p to open Files
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()
nnoremap <silent> <C-p> :ProjectFiles <cr>

" ==================================================
" ===== Plugin settings ============================
" ==================================================
"

" Launch rg on current word with ,a.
" Launch rg without argument with ,A.
let g:rg_derive_root='true'
nnoremap <leader>a :Rg <cword><space>
nnoremap <leader><s-a> :Rg <space>

" SplitJoin commands
nmap <Leader>j :SplitjoinJoin<cr>
nmap <Leader>s :SplitjoinSplit<cr>
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0

" Leader g to search all open buffers
nnoremap <leader>g :bgrep

" Shortcut for tagbar plugin
nnoremap <leader>tt :TagbarToggle<cr>

" Options for buffergator:
" - open buffergator in the bottom
" - set its height
" - sort buffers by extension and filepaths
let g:buffergator_viewport_split_policy="b"
let g:buffergator_split_size=15
let g:buffergator_sort_regime="extension"

" Leader comma to align text with commas
vnoremap <leader>, :Tab /,\zs/l0r1<CR>

" Auto save and auto reload sessions
let g:session_autosave='yes'
let g:session_autoload='yes'

" Open GUndo with <leader>u
nnoremap <leader>u :GundoToggle<CR>

" Vim-Airline settings
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1
let g:airline_section_c='%F'

" Nerd commenter settings
let g:NERDSpaceDelims = 1

" Ale
highlight ALEError ctermfg=DarkMagenta
highlight ALEWarning ctermfg=DarkMagenta

let g:ale_linters = { 'python': [] }

" Ultisnips
let g:UltiSnipsSnippetDirectories = ['/home/gat/.vim/ultisnips', 'UltiSnips']

" FZF
" let $FZF_DEFAULT_COMMAND = "rg -n ^"

" Coc
let g:coc_global_extensions = [
  \ 'coc-ultisnips',
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ 'coc-elixir',
  \ 'coc-solargraph',
  \ 'coc-stylelintplus'
\]

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

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" ==================================================
" ===== Auto commands ==============================
" ==================================================

if has("autocmd")
  augroup custom
    " Clear previous auto commands
    au!

    " Sets indentation for other files
    au FileType cpp setlocal ts=4 sts=4 sw=4 noexpandtab
    au FileType elm setlocal ts=4 sts=4 sw=4 expandtab
    au FileType java setlocal ts=4 sts=4 sw=4 noexpandtab
    au FileType lua setlocal ts=4 sts=4 sw=4 expandtab
    au FileType go setlocal ts=2 sts=2 sw=2 noexpandtab
    au FileType python setlocal ts=2 sts=2 sw=2 expandtab

    " Auto source .vimrc file when saved
    au bufwritepost .vimrc source $MYVIMRC

    " Run go fmt on .go file save
    au bufwritepre *.go :GoFmt

    " Enable wrap and linebreak in txt files
    au BufRead,BufNewFile *.txt setlocal textwidth=80 linebreak

    au BufRead,BufNewFile {Gemfile,Guardfile} set ft=ruby
  augroup END
endif

" =================================================
" ====== The great .vimrc rewrite of 2018 ========
" =================================================

" List open buffers and await input
nnoremap <leader>l :ls<CR>:b<space>

" Set path to root directory and enable find shortcut
set path=.,**
nnoremap <leader>f :find *

set wildcharm=<C-z>
nnoremap <leader>bf :buffer <C-z><S-Tab>

" Remove tags from autocomplete
set complete-=i

" ==================================================
" ===== Disabled commands ==========================
" ==================================================
"
" This section contains commands which are not used anymore, but might come in
" handy in the future.
" Description should contain reason as to why it is disabled in addition to
" specyfying what the command does.

" When firing Vim move cursor from any plugin to the main window
" Not used as Vim is only opened with one window now
" autocmd VimEnter * wincmd p

" This mapping breaks ctrl-i combination. Disabled until figured out if it's
" possible to map the two keys independently
"nnoremap <tab> %
"vnoremap <tab> %

" Color column on given column number
" DISABLED - ugly :)
" set colorcolumn=85

" Save on losing focus
" Not really needed now
" :au FocusLost * :w

" Fire up NERDTree faster
" Not using NERDTree anymore
"let NERDTreeShowHidden=1
"nnoremap <leader>nt :NERDTree<cr>

" Find currently opened file in NERDTree faster
" Not using NERDTree anymore
"map <leader>r :NERDTreeFind<cr>

" Create undo file during file edition so that it is possible to undo actions even after reopening the file
" Annoying...
" set undofile
