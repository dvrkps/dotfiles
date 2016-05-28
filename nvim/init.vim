call plug#begin('~/.config/nvim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'tpope/vim-fugitive'
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
nnoremap <silent><leader><leader> :nohlsearch<cr>
" buffers
nnoremap <silent><a-tab> <c-w><c-w>
nnoremap <silent><s-tab> :ls<cr>:b<space>
" configuration
nnoremap <silent> <leader>vim :edit $MYVIMRC<cr>
autocmd! bufwritepost vimrc :source $MYVIMRC
" terminal
tnoremap <Esc> <C-\><C-n>

" *** setting ***
filetype plugin indent on
set clipboard+=unnamedplus
set hidden
set ignorecase
set smartcase
syntax enable
set number relativenumber
set cursorline
set nowrap
set notimeout ttimeout ttimeoutlen=10
set lazyredraw

" quickfix window on very bottom
autocmd FileType qf wincmd J 

" resize splits
autocmd VimResized * :wincmd =
"
" always start terminal in insert mode
autocmd BufWinEnter,WinEnter term://* startinsert

colorscheme solarized
call togglebg#map("") " f5 = dark/light background

" status line
set statusline=%n:\ %f 
set statusline+=%{fugitive#statusline()}
set statusline+=%=
set statusline+=%c

" *** markdown ***
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" *** git ***
nmap <leader>g :Gstatus<cr>
nmap <leader><leader>g :!git l<cr>

" *** golang ***
au BufNewFile,BufRead *.go setlocal noet ts=8 sw=8 sts=8
let g:go_fmt_command = "goimports"

let g:go_term_enabled = 1
let g:go_term_mode = "split"

autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t :GoTest<cr>
autocmd FileType go nmap <leader>z :GoTest -race<cr>
autocmd FileType go nmap <leader>c :GoCoverageToggle<cr>
autocmd FileType go nmap <leader><leader>c :terminal go test -cover<cr>
autocmd FileType go nmap <leader>b :terminal go test -run=XXX -bench=. -benchmem<cr>
autocmd FileType go nmap <leader>l :terminal gometalinter --deadline 90s<cr>

