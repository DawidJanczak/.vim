" Colorscheme used
colorscheme mustang

" Sets font for GVim
set gfn=DejaVu_Sans_Mono:h12:cEASTEUROPE

" Sets syntax highlighting
syntax on

" bgreps uses grep on open buffers only. Courtesy of hotchpotch on github
function! Bgrep(word)
    cexpr '' " quickfix
    silent exec ':bufdo | try | vimgrepadd ' . a:word . ' % | catch | endtry'
    silent cwin
endfunction
command! -nargs=1 Bgrep :call Bgrep(<f-args>)

filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

filetype indent on

" Tabs mapped to 2 space characters
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

" Allow switching between buffers when there are changes made and buffers are
" not saved
set hidden

" Show available commands when TAB is pressed
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

" Map leader key to ','
let mapleader = ","

" ==================================================
" ===== Search/replace section =====================
" ==================================================

" Automatically add \v when searching so that regexp acts more like in PERL
nnoremap / /\v
vnoremap / /\v

" Ignore case while searching
set ignorecase

" Smartcase search with ignorecase on causes vim to:
" - ignore case is on when only lower letters are used
" - ignore case is off when at least one upper case letter is present in the word
set smartcase

" Setting gdefault causes automatic \g flag addition when replacing. This means that all occurences in the file will be replaced.
set gdefault

" Incremental search means the search will be performed and refined after every key input, not after hitting enter.
set incsearch

" Highlights matching brace
set showmatch

" Highlights serach results
set hlsearch

" , + space can be used to clear search results. Tab is used instead of % to
" jump to matching brace. This is great in visual mode - marks text inside the
" brackets with Tab.
nnoremap <leader><space> :noh<cr>

" ==================================================
" ===== Wrapping ===================================
" ==================================================

" Set wrap on width = 79 so that the text is automatically moved to the next
" line
set wrap
set textwidth=79
set formatoptions=qnr1

" ==================================================
" ===== Misc key mappings ==========================
" ==================================================

" Some additional mappings:
" 1. Disable arrow keys
" 2. j and k work on VISIBLE lines instead of actual lines (helpful when
" sentence is wrapped)
" 3. Disable F1 key
" 4. Maping ; to : makes issuing commands faster.

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

inoremap <leader>{ {<space>\|<space>}<ESC>hi

" ==================================================
" ===== Leader commands ============================
" ==================================================

" ,W removes all trailing spaces in a file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Folding tags
nnoremap <leader>ft Vatzf

" Open .vimrc in splitted window
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Go from insert mode to normal mode with jj
inoremap jj <ESC>
inoremap <ESC> <nop>

" Open a new vertically split window and move to it
nnoremap <leader>w <C-w>v<C-w>l

" Some mappings for switching active split window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Mappings for inserting a blank line before/after current one without entering
" insert mode.
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>

" ==================================================
" ===== Plugins settings ===========================
" ==================================================

" Launch Ack with ,a
let g:ackprg="C:\\strawberry\\perl\\site\\bin\\ack.bat -H --nocolor --nogroup --column"
nnoremap <leader>a :Ack <cword> 

" let Tlist_Ctags_Cmd="/home/janczak/software/ctags-5.8/ctags"
let Tlist_Use_Right_Window=1
nnoremap <leader>tl :TlistToggle<cr>
set tags=tags;/

" Leader g to search all open buffers
nnoremap <leader>g :Bgrep 

" Options for buffergator:
" open buffergator in the bottom
let g:buffergator_viewport_split_policy="B"
" set its height
let g:buffergator_split_size=5
" sort buffers by extension and filepaths
let g:buffergator_sort_regime="extension"

" Set ctags executable path for tagbar.
let g:tagbar_ctags_bin='D:\Ruby\ctags\ctags58\ctags.exe'
" Set tagbar shortcut
nnoremap <leader>tt :TagbarToggle<cr>

" ==================================================
" ===== Auto commands ==============================
" ==================================================

if has("autocmd")
  " Set local working directory to current buffer file's directory
  " Vim gets confused when switching to buffergator window as it wants to find
  " [[buffergator file. Hence the conditional statement.
  autocmd BufEnter * if expand("%") !~ '[[.*' | silent! lcd %:p:h | endif

  " Sets indentation for cpp files
  autocmd FileType cpp setlocal ts=4 sts=4 sw=4 expandtab
endif

" Remember open buffers even after quitting vim
:exec 'set viminfo=%,' . &viminfo

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
