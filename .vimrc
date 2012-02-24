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

" Great small function to switch from header to cpp file and back
function! SwitchSourceHeader()
	if (expand("%:e") == "cpp")
		find %:t:r.h
	else
		find %:t:r.cpp
	endif
endfunction

" ==================================================
" ===== General options ============================
" ==================================================

" Colorscheme used
colorscheme mustang

" Sets font for GVim
set gfn=DejaVu_Sans_Mono:h12:cEASTEUROPE

" Sets syntax highlighting
syntax on

" Pathogen settings
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
filetype indent on

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

" Show filename only in tabs
set tabline=%!MyTabLine()

" Map leader key to ','
let mapleader = ","

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

" ==================================================
" ===== Misc key mappings ==========================
" ==================================================

" Some additional mappings:
" 1. disable arrow keys
" 2. j and k work on visible lines instead of actual lines (helpful when sentence is wrapped)
" 3. disable f1 key

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
inoremap <f1> <esc>
nnoremap <f1> <esc>
vnoremap <f1> <esc>

" Use backslash key twice to switch to previously edited buffer
nnoremap \\ :b#<cr>
inoremap \\ <esc>:b#<cr>

" Mappings for easier tab navigating
nnoremap <s-h> gt
nnoremap <s-l> gt

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
inoremap <esc> <nop>

" Open a new vertically split window and move to it
nnoremap <leader>w <c-w>v<c-w>l

" Mappings for switching active split window
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Mappings for inserting a line before/after current one without going into insert mode and without going to new line.
nnoremap <leader>o o<esc>
nnoremap <leader>o o<esc>

" ==================================================
" ===== Plugin settings ============================
" ==================================================

" Launch ack on current word with ,a.
" Launch ack without argument with ,A.
nnoremap <leader>a :ack! <cword>
nnoremap <leader><s-a> :ack!

" Leader s to switch between source/header files (c++)
nmap ,s :call switchsourceheader()<cr>

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

" Auto save and auto reload sessions
let g:session_autosave='yes'
let g:session_autoload='yes'

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
  autocmd FileType ttcn setlocal ts=4 sts=4 sw=4 expandtab
  
  " Set local working directory to current buffer file's directory
  autocmd bufenter * lcd %:p:h

  " Auto source .vimrc file when saved
  autocmd bufwritepost .vimrc source $MYVIMRC
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
