



set nocompatible
filetype on
filetype indent on
filetype plugin on

" Setting up Vundle
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle..."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Plugin 'gmarik/vundle'
    " Add your plugins
    Plugin 'Syntastic' 
    Plugin 'scrooloose/nerdtree'
    " End of plugins list
    if iCanHazVundle == 0
        echo "Installing Plugins, please ignore key map error messages"
        echo ""
        :PluginInstall
    endif
" End of Vundle Setup

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
