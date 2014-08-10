set nocompatible
filetype on
filetype indent on
filetype plugin on

" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" ========================================================================================
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
    Plugin 'tpope/vim-surround'
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'tomtom/tlib_vim'
    Plugin 'garbas/vim-snipmate'
    Plugin 'honza/vim-snippets'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'Lokaltog/vim-powerline'
    Plugin 'tpope/vim-markdown'
        " Plugins for Javascript
        Plugin 'jelera/vim-javascript-syntax'
        Plugin 'pangloss/vim-javascript'
        Plugin 'nathanaelkane/vim-indent-guides'
	Plugin 'Raimondi/delimitMate'
    " End of plugins list
    if iCanHazVundle == 0
        echo "Installing Plugins, please ignore key map error messages"
        echo ""
        :PluginInstall
    endif
" End of Vundle Setup
" ========================================================================================
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set relativenumber
set numberwidth=5
set laststatus=2
" Turn on syntax highlighting
syntax enable 
set visualbell
set wildmenu
set backspace=indent,eol,start
set encoding=utf-8
set undofile
" =================================
" -------- Set colorscheme -------- 
" =================================
set background=dark

if $COLORTERM == 'gnome-terminal'
    "set t_Co=256
    colorscheme lucius
    let g:Powerline_symbols = 'compatible'
    set t_ut=
else 
    let g:Powerline_symbols = 'fancy'
    " let g:solarized_termcolors=256
    colorscheme solarized 
endif
call togglebg#map('<F7>')
" highlight Normal ctermbg=NONE
" highlight nonText ctermbg=NONE
set cursorline
set cursorcolumn
set ruler
" set textwidth=79

" ======== Indentation ======== 
set autoindent
set smartindent
set smarttab
set tabstop=8
set softtabstop=8 
set shiftwidth=8
set noexpandtab

" ======== Wrapping ===========
set wrap
set textwidth=0 wrapmargin=0 " tuns off wrap automatic insertion of newlines
set linebreak "Smarter word-sensitive linebreak
" set showbreak=>\  "Visual clue for linebreak


" ======== Scrolling ======== 
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" ======== Search ======== 
set smartcase
set incsearch
set hlsearch
set showmatch
set ignorecase

" ========= Abbrev =======
cnoreabbrev Wq q
cnoreabbrev wrap set wrap
cnoreabbrev nowrap set nowrap

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

" coding regex style
nnoremap / /\v
vnoremap / /\v

let mapleader=","
nnoremap <leader>m :NERDTreeToggle<CR>

" Ctr C puts you in the middle of new brackets
imap <C-c> <CR><CR><Esc>k0

" ======== Windows management ======== 
set winwidth=84
set winminwidth=60
set winwidth=999
" set winheight=84
" set winminheight=10
" set winheight=999

" ===================================
" ======== Autocmd ------------------
" ===================================
autocmd BufRead,BufWritePre *.html normal gg=G
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd Filetype html nnoremap <leader>b I<!--<esc>A--><esc>

" ==================================
" ------- Dummy Function -----------
" ==================================
function! AddHelloToTop()
    normal HOhello thereA vim user0
    s/hello there/hi/
    return "we added a message"
endfunction

command! Hello call AddHelloToTop()
nnoremap <leader>h :call AddHelloToTop()<CR>


function! InsertTabWrapper()
    let col = col(".") - 1
    if !col || getline(".")[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction

inoremap <s-tab> <c-r>=InsertTabWrapper()<cr>
" inoremap <s-tab> <c-p>

function! VimCommentToggle()
    let col = col(".") - 1
    if getline(".")[0] == '"'
        :s:\v"\s*::
    else 
        normal! I" 
    endif
endfunction

nnoremap <leader>c :call VimCommentToggle()<CR>
