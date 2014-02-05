" ==================================================
" ===== Functions ==================================
" ==================================================

" bgreps uses grep on open buffers only. Courtesy of hotchpotch on github
function! Bgrep(word)
    cexpr '' " quickfix
    silent exec ':bufdo | try | vimgrepadd ' . a:word . ' % | catch | endtry'
    silent cwin
endfunction
command! -nargs=1 Bgrep :call Bgrep(<f-args>)

" Function used in MyTabLine that causes printing filename only
if !exists("*MyTabLabel")
  function MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    return fnamemodify(bufname(buflist[winnr - 1]), ":t")
  endfunction
endif

" Show only filename, not the full file path, in tab header
if !exists("*MyTabLine")
  function MyTabLine()
    let s = ''

    for i in range(tabpagenr('$'))
      if i + 1 == tabpagenr()
        let s .= '%#TabLineSel#'
      else
        let s .= '%#TabLine#'
      endif

      let s .= '%' . (i + 1) . 'T'

      let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
    endfor

    let s .= '%#TabLineFill#%T'

    if tabpagenr('$') > 1
      let s .= '%=%#TabLine#%999Xclose'
    endif

    return s
  endfunction
endif

" ==================================================
" ===== General options ============================
" ==================================================

" Sets font for GVim
set gfn=DejaVu_Sans_Mono:h12:cEASTEUROPE

" Vundle settings and bundles
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'mileszs/ack.vim.git'
Bundle 'jeetsukumaran/vim-buffergator.git'
Bundle 'vim-scripts/IndexedSearch.git'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'majutsushi/tagbar.git'
Bundle 'tpope/vim-surround.git'
Bundle 'sjl/gundo.vim.git'
Bundle 'tpope/vim-endwise.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'scrooloose/syntastic.git'
Bundle 'roman/golden-ratio.git'
Bundle 'vim-scripts/L9'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'godlygeek/tabular.git'
Bundle 'mikbe/rspec.vim.git'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-bundler.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'kien/ctrlp.vim.git'
Bundle 'tpope/vim-ragtag.git'
Bundle 'juvenn/mustache.vim.git'
Bundle 'nanotech/jellybeans.vim.git'
Bundle 'lepture/vim-jinja'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-repeat'
Bundle 'suan/vim-instant-markdown'

filetype plugin indent on

" Colorscheme used plus syntax highlighting
syntax on
set background=dark
"colorscheme mustang
" Solarized theme with transparent terminal support.
let g:solarized_termtrans=1
colorscheme solarized

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

" Show filename only in tabs
set tabline=%!MyTabLine()

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
set wildignore+=*/tmp/*

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

" Mappings for easier tab navigating
nnoremap <s-h> gT
nnoremap <s-l> gt

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

" Put ruby shebang in the beginning of the file
nnoremap <leader>r ggO<esc>S#!/usr/bin/env ruby<cr><esc>^Dj

" ==================================================
" ===== Plugin settings ============================
" ==================================================
"

" Launch ack on current word with ,a.
" Launch ack without argument with ,A.
nnoremap <leader>a :Ack! -k <cword><space>
nnoremap <leader><s-a> :Ack! -k<space>

" Leader s to switch between source/header files (c++)
nmap ,s :call SwitchSourceHeader()<cr>

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

" Options for syntastic
let g:syntastic_coffee_coffeelint_args="--csv -f /home/janczak/dotfiles/.coffeelint.json"

" Vim-Airline settings
let g:airline_theme='bubblegum'
let g:airline_section_c='%{getcwd()}/%t'

" ==================================================
" ===== Auto commands ==============================
" ==================================================

if has("autocmd")
  augroup custom
    " Clear previous auto commands
    autocmd!

    " Set local working directory to current buffer file's directory
    " Vim gets confused when switching to buffergator window as it wants to find
    " [[buffergator file. Hence the conditional statement.
    autocmd BufEnter * if expand("%") !~ '[[.*' | silent! lcd %:p:h | endif

    " Sets indentation for other files
    autocmd FileType cpp setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType java setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType lua setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType ttcn setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType tcl setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType go setlocal ts=2 sts=2 sw=2 noexpandtab

    " Set local working directory to current buffer file's directory
    autocmd bufenter * if expand('%:p') !~ '://' | :lchdir %:p:h | endif

    " Auto source .vimrc file when saved
    autocmd bufwritepost .vimrc source $MYVIMRC

    " Run go fmt on .go file save
    autocmd bufwritepre *.go Fmt
  augroup END
endif

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
