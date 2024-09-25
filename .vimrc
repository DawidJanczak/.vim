" ==================================================
" ===== General options ============================
" ==================================================

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'andymass/vim-matchup'
Plug 'ap/vim-css-color'
Plug 'cocopon/iceberg.vim'
Plug 'delphinus/vim-firestore'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'jeetsukumaran/vim-buffergator'
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'LnL7/vim-nix'
Plug 'machakann/vim-sandwich'
Plug 'mattn/emmet-vim'
Plug 'mtscout6/vim-cjsx'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'puppetlabs/puppet-syntax-vim'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'redhat-developer/yaml-language-server'
Plug 'scrooloose/nerdcommenter'
Plug 'simnalamburt/vim-mundo'
Plug 'SirVer/ultisnips'
Plug 'someone-stole-my-name/yaml-companion.nvim'
Plug 'stevearc/conform.nvim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rake'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yong1le/darkplus.nvim'
Plug 'sainnhe/everforest'

call plug#end()

" Colorscheme used plus syntax highlighting
syntax on
set termguicolors
set background=dark
colorscheme darkplus
" set background=light
" colorscheme everforest

" Tabs mapped to 2 space characters (Ruby default)
set tabstop=2
set shiftwidth=2
set shiftround " Round the >> indentation to shiftwidth characters
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
set relativenumber number

" Map leader key to ','
let mapleader = ","

" Yanking and cutting to * registry
set clipboard+=unnamedplus

" Save swap files elsewhere
set backupdir=~/tmp/
set directory=~/tmp/

" Remove octal from number formats so that incrementing 07 works as expected.
set nrformats-=octal

" Settings below taken from https://github.com/neoclide/coc.nvim#example-vim-configuration

" Increase cmd height
set cmdheight=2

" Update swap more often
set updatetime=300

" Don't show ins-completion-menu
set shortmess+=c
inoremap ,, <C-x><C-o>
set completeopt-=preview
"<C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>" : ""<CR>

" Set path to root directory and enable find shortcut
set path=.,**

" Create undo file during file edition so that it is possible to undo actions even after reopening the file
set undofile
set undodir=~/.vim/undo

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

" Re-enable pasting with middle click on wayland
set mouse=

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

" ==================================================
" ===== Leader commands ============================
" ==================================================

" Leader w removes all trailing spaces in a file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" Open .vimrc in splitted window
nnoremap <leader>ev :tabe $MYVIMRC<cr>

" Go from insert mode to normal mode with jj
inoremap jj <esc>

" Mappings for switching active split window
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Mappings for inserting a line before/after current one without going into insert mode and without going to new line.
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" ctrl+p to open GFiles from fzf
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()
nnoremap <silent> <C-p> :ProjectFiles <cr>

" List open buffers and await input
nnoremap <leader>l :ls<CR>:b<space>

" ==================================================
" ===== Plugin settings ============================
" ==================================================

" SplitJoin commands
nmap <Leader>j :SplitjoinJoin<cr>
nmap <Leader>s :SplitjoinSplit<cr>
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0

" Options for buffergator:
" - open buffergator in the bottom
" - set its height
" - sort buffers by extension and filepaths
let g:buffergator_viewport_split_policy="b"
let g:buffergator_split_size=15
let g:buffergator_sort_regime="extension"

" Open MUndo with <leader>u
nnoremap <leader>u :MundoToggle<CR>

" Vim-Airline settings
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1
let g:airline_section_c='%F'

" Nerd commenter settings
let g:NERDSpaceDelims = 1

" Ultisnips
let g:UltiSnipsSnippetDirectories = ['/home/gat/.vim/ultisnips']

" Sideways

nnoremap <leader>< :SidewaysLeft<cr>
nnoremap <leader>> :SidewaysRight<cr>

" UltiSnips

let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"

" vim-matchup

let g:matchup_matchparen_offscreen = {}

" Emmet vim
" let g:user_emmet_settings = {
    " " \  'format.forceIndentationForTags' : 'label'
    " " \}

" ==================================================
" ===== Auto commands ==============================
" ==================================================

if has("autocmd")
  augroup custom
    " Clear previous auto commands
    au!

    " Sets indentation for other files
    au FileType elm setlocal ts=4 sts=4 sw=4 expandtab
    au FileType lua setlocal ts=4 sts=4 sw=4 expandtab
    au FileType go setlocal ts=2 sts=2 sw=2 noexpandtab
    au FileType python setlocal ts=2 sts=2 sw=2 expandtab

    " Auto source .vimrc file when saved
    au bufwritepost .vimrc source $MYVIMRC

    " Enable wrap and linebreak in txt files
    au BufRead,BufNewFile *.txt setlocal textwidth=80 linebreak

    au BufRead,BufNewFile {Gemfile,Guardfile} set ft=ruby
  augroup END

  " Return to last edit position when opening files (You want this!)
  autocmd BufReadPost *
        \ if expand('%:t') != 'COMMIT_EDITMSG' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif
