set nocompatible
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=3 shiftwidth=3      " a tab is four spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

call pathogen#infect()
set title
set background=dark
colorscheme solarized

" Make trailing whitespace visible
set list listchars=eol:\ ,tab:>-,trail:.,extends:>,nbsp:_

syntax spell toplevel

" Auto number... 
set nu

set modeline

" Fast buffer switching

map <C-N> <Esc>:bn<CR>
map <C-P> <Esc>:bp<CR>

" autoindent is evil
set noai

" gui settings

set guifont=Courier\ 10\ Pitch\ 14

" Makes buffers not need to be saved when hidden.  Use with care.
set hidden
" set visualbell
" set digraph

" Set tabs to four spaces if the filetype is Python
au FileType python set tabstop=4 shiftwidth=4

" Plugins
" Use :Helptags to generate the help files for all of the plugins

" Enable Mouse
set mouse=a

" TagBar Configuration
source ~/.vim/conf/tagbar.vim

" CtrlP Configuration
source ~/.vim/conf/ctrlp.vim

" Neocomplcache Configuration
source ~/.vim/conf/neocomplcache.vim

" NERDTree key map
nmap <F7> :NERDTree<CR>

if &term =~ "xterm"
     set t_Co=256
  endif
