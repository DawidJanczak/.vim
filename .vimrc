colorscheme mustang
set formatoptions=cqt

" Sets syntax highlighting
syntax on

" bgreps uses grep on open buffers only. Courtesy of hotchpotch on github
function! Bgrep(word)
    cexpr '' " quickfix
    silent exec ':bufdo | try | vimgrepadd ' . a:word . ' % | catch | endtry'
    silent cwin
endfunction
command! -nargs=1 Bgrep :call Bgrep(<f-args>)

function MyTabLabel(n)
	let buflist = tabpagebuflist(a:n)
	let winnr = tabpagewinnr(a:n)
	return fnamemodify(bufname(buflist[winnr - 1]), ":t")
endfunction

" Show only filename, not the full file path, in tab header
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

function! SwitchSourceHeader()
	if (expand("%:e") == "cpp")
		find %:t:r.h
	else
		find %:t:r.cpp
	endif
endfunction

nmap ,s :call SwitchSourceHeader()<CR>

filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

filetype indent on

set nocompatible

"set modelines=0

" Tabs mapped to 4 space characters
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set expandtab

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

" Show filename only in tabs
set tabline=%!MyTabLine()

" set undofile

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
" This mapping breaks ctrl-i combination. Disabled until figured out if it's
" possible to map the two keys independently
"nnoremap <tab> %
"vnoremap <tab> %

" ==================================================
" ===== Wrapping ===================================
" ==================================================

" Set wrap on width = 79 so that the text is automatically moved to the next
" line
set wrap
"set textwidth=79
"set formatoptions=cqt
" nr1
" Color column on given column number
" DISABLED
" set colorcolumn=85

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
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Save on losing focus
:au FocusLost * :w

" Use backslash key twice to switch to previously edited buffer
nnoremap \\ :b#<CR>
inoremap \\ <ESC>:b#<CR>

" Mappings for easier tab navigating
:nnoremap <S-h> gT
:nnoremap <S-l> gt

"inoremap { {<cr>}<ESC>O<tab>
"inoremap <leader>{ {<space><space>}<ESC>hi

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

" Mappings for inserting a line before/after current one without going into
" insert mode and without going to new line.
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>

" ==================================================
" ===== Plugin settings ============================
" ==================================================

" Launch Ack with ,a
let g:ackprg="/home/janczak/software/ack/ack -H --nocolor --nogroup --column"
nnoremap <leader>a :Ack! <cword> 
nnoremap <leader><S-a> :Ack! 

" Leader g to search all open buffers
nnoremap <leader>g :Bgrep 

" Shortcut for tagbar plugin
nnoremap <leader>tt :TagbarToggle<cr>

" Options for buffergator:
" open buffergator in the bottom
let g:buffergator_viewport_split_policy="B"
" set its height
let g:buffergator_split_size=15
" sort buffers by extension and filepaths
let g:buffergator_sort_regime="extension"

" Auto save and auto reload sessions
let g:session_autosave='yes'
let g:session_autoload='yes'

" ==================================================
" ===== Auto commands ==============================
" ==================================================

" Set local working directory to current buffer file's directory
autocmd BufEnter * lcd %:p:h

" When firing vim move cursor from any plugin to the main window
autocmd VimEnter * wincmd p

":exec 'set viminfo=%,' . &viminfo
