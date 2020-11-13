call plug#begin('~/.config/nvim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'fatih/vim-go'
call plug#end()

" *** global mappings ***
map <space> <leader>
map <space><space> <leader><leader>
" save
nnoremap <Leader>w :w<cr>
" quit current window 
nnoremap <Leader>q :q<cr>
" escape to normal mode
inoremap jk <esc>
" insert newline in normal mode
nnoremap <Enter> O<esc>j
" remove search highlights 
nnoremap <silent> <leader><leader> :nohlsearch<cr>
" buffers
nnoremap <silent> <tab> :silent :bnext<cr>
nnoremap <silent> <s-tab> :silent :bprevious<cr>
" configuration
nnoremap <silent> <leader>vim :edit $MYVIMRC<cr>
autocmd! bufwritepost vimrc :source $MYVIMRC
" terminal
tnoremap <Esc> <C-\><C-n>

" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" *** setting ***
filetype plugin indent on
syntax off
set clipboard+=unnamedplus
set hidden
set ignorecase
set smartcase
set number relativenumber
set cursorline
set nowrap
set notimeout ttimeout ttimeoutlen=10
set lazyredraw

" quickfix window on very bottom
autocmd FileType qf wincmd J 

" resize splits
autocmd VimResized * :wincmd =

" always start terminal in insert mode
autocmd BufWinEnter,WinEnter term://* startinsert

colorscheme solarized
set background=light

" *** markdown ***
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" *** yaml ***
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" *** go ***
au BufNewFile,BufRead *.go setlocal filetype=go noet ts=8 sw=8 sts=8
let g:go_fmt_command = "goimports"
let g:go_term_enabled = 1
let g:go_term_mode = "split"


autocmd FileType go nmap <leader>r :terminal go run .<cr>i
autocmd FileType go nmap <leader>t :terminal go test -v -race -cover<cr>i
autocmd FileType go nmap <leader>c :syntax on<cr>:GoCoverageToggle<cr>:syntax off<cr>
autocmd FileType go nmap <leader>b :terminal go test -run=XXX -bench=. -benchmem<cr>i
autocmd FileType go nmap <leader>l :terminal golangci-lint run --enable-all<cr>i

