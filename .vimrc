set nocompatible              " be iMproved, required
filetype off                  " required
set autochdir

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
let path='~/.vim/bundle'
call vundle#begin(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
"
" original repos on github
" dash plugin for OS X
Plugin 'rizzatti/dash.vim'

" Plugin 'refactor'
Plugin 'YankRing.vim'
"Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'Lokaltog/vim-powerline'
Bundle 'sjl/gundo.vim'
Bundle 'klen/python-mode'
"Bundle 'majutsushi/tagbar'
"Bundle 'myusuf3/numbers.vim'
"Bundle 'vim-scripts/ScrollColors'
"Bundle 'vim-scripts/mru.vim'
"Bundle 'vim-scripts/CSApprox.git'
Bundle 'chrisbra/DynamicSigns'
Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
"Bundle 'skammer/vim-css-color'
Bundle 'kien/ctrlp.vim'
"Bundle 'tpope/vim-surround'
Bundle 'whatyouhide/vim-gotham'
"Bundle 'airblade/vim-gitgutter'
"Bundle 'xsbeats/vim-blade'

" vim-scripts repos
" non github repos

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set wildmenu

set hidden
set nowrap
set tabstop=4
set backspace=indent,eol,start
set autoindent
set number
set shiftwidth=4
set shiftround
set showmatch
set ignorecase
set smartcase

set smarttab

set laststatus=2
set encoding=utf-8

set hlsearch
set incsearch

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set visualbell
set noerrorbells

set nobackup
set noswapfile

if has('autocmd')
    filetype plugin indent on
    autocmd filetype python set expandtab
endif
" Toggle relative numbers plugin
nnoremap <silent><leader>rn :set relativenumber!<cr>

set t_Co=256
colorscheme gotham256

" Set font depending on OS!
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 11
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

set rnu!

if &t_Co > 2 || has("gui_running")
    syntax on
endif

set pastetoggle=<F7>
" if hit enter -> clear search hl results!
nnoremap <CR> :noh<CR><CR>:<backspace>
nnoremap ; :
nnoremap <space> za
nnoremap <F6> :set hlsearch!<CR>

" numbers vim
" nnoremap <F2> :GitGutterToggle<CR>
nnoremap <F4> :NumbersToggle<CR>
nnoremap <F5> :GundoToggle<CR>
nnoremap <F6> :TagbarToggle<CR>
" Nerd Tree toggle with f1, f2, f3!
map <F1> :NERDTreeToggle<CR>
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeToggle<CR>

set foldmethod=syntax
set foldlevel=3

" history of actions !!! deleted stufff, pasted stuff
" :nnoremap <silent> <F11> :YRShow<CR>

"set ofu=syntaxcomplete#Complete

"set guioptions-=m  "remove menu bar
"set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove right-hand scroll bar

" Alternating Line colors with DynamicSigns plugin
" let g:Signs_Alternate=1
" autocmd VimEnter * UpdateSigns

" Indentation lines
set ts=4 sw=4 et
let g:indent_guides_start_level=2
let g:indent_guides_guide_size = 1

let g:ctrlp_cmd = 'call CallCtrlP()'

func! CallCtrlP()
    if exists('s:called_ctrlp')
        CtrlPLastMode
    else
        let s:called_ctrlp = 1
        CtrlPMRU
    endif
endfunc

" Use autocompletion with TAB !
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

" Screen size options
" If GVIM -> Full screen
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=900 columns=900
endif
