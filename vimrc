call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'fatih/vim-go', {'for': 'go'}

call plug#end()

set nocompatible              	" be iMproved, required
filetype off                  	" required
filetype plugin indent on    	" required

set encoding=utf-8
scriptencoding utf-8
set showcmd			" display incomplete commands

set viminfo+=n~/.vim/viminfo

" change the mapleader
" let mapleader="\<Space>"
map <space> <leader>
map <space><space> <leader><leader>

" Quickly edit/reload the vimrc file
nnoremap <silent> <leader>vim :edit $MYVIMRC<cr>
autocmd! bufwritepost vimrc source $MYVIMRC


" remove arrow keys
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

" save
nnoremap <Leader>w :w<CR>

" :q
nnoremap <Leader>q :q<CR>

" Esc
inoremap jk <Esc>

" Windows change
nnoremap <tab> <C-w><C-w>
" Buffer change
nnoremap <s-tab> :bn<cr>

" Insert newline normal mode
nmap <Enter> O<Esc>j

" Status line
set laststatus=2
set statusline=%f
set statusline+=%=
set statusline+=%c

syntax enable

set number
set autoread
set hidden
set cursorline
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set ttyfast
set notimeout
set ttimeout
set ttimeoutlen=10
set lazyredraw

" Whitespace
set nowrap
set tabstop=4 shiftwidth=4
set backspace=indent,eol,start

" Searching
set hlsearch				" highlight matches
set incsearch				" incremental searching
set ignorecase
set smartcase
nnoremap <silent> <leader><leader> :nohlsearch<CR>

" Scrolling
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

set nobackup
set noswapfile

set history=1000         " remember more commands and search history
set undolevels=100       " use many muchos levels of undo

let g:solarized_termtrans=0
colorscheme solarized

" *** markdown ***
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" *** git ***
nmap <leader>g :!git s<cr>
nmap <leader><leader>g :!git l<cr>

" *** golang ***
au BufNewFile,BufRead *.go setlocal noet ts=8 sw=8 sts=8
let g:go_fmt_command = "goimports"

au FileType go nmap <leader><leader>t :!clear;go test -cover<cr>
au FileType go nmap <leader>t :!clear;go test<cr>
au FileType go nmap <leader>b :!clear;go test -run=XXX -bench=.<cr>
au FileType go nmap <leader>r :GoRun<cr>
au FileType go nmap <leader>l :!gometalinter<cr>
