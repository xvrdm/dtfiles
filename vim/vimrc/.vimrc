set nocompatible
filetype on
filetype indent on
filetype plugin on
call pathogen#infect()

set number

" Turn on syntax highlighting
syntax enable 

set backspace=indent,eol,start
set encoding=utf-8

" =================================
" -------- Set colorscheme -------- 
" =================================
set background=dark

"if $COLORTERM == 'gnome-terminal'
    "set t_Co=256
"endif
"let g:solarized_termcolors=256
colorscheme lucius
call togglebg#map("<F7>")

highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
set cursorline
set cursorcolumn
set ruler
set textwidth=79

" ======== Indentation ======== 
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set expandtab

set nowrap
set linebreak

" ======== Scrolling ======== 
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" ======== Search ======== 
set smartcase
set incsearch
set hlsearch
set showmatch

" ========= Remap ======== 
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

nnoremap j gj
nnoremap k gk

imap ii <ESC>
imap uu <C-o>
nnoremap ; :

let mapleader=","
nnoremap <leader>m :NERDTreeToggle<CR>

" ======== Windows management ======== 
set winwidth=84
set winminwidth=30
set winwidth=999
"set winheight=84
"set winminheight=10
"set winheight=999

" ===================================
" ======== Autocmd ------------------
" ===================================
autocmd BufRead,BufWritePre *.html normal gg=G

autocmd Filetype html nnoremap <leader>c I<!--<esc>A--><esc>
autocmd Filetype javascript nnoremap <leader>c I//<esc>
autocmd Filetype vim nnoremap <leader>c I"<esc>
