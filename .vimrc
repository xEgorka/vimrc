set autochdir
set autoindent
set background=dark
set backspace=indent,eol,start
set colorcolumn=80
set expandtab
set formatoptions+=t
set hidden
set history=10000
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set incsearch
set laststatus=2
set listchars=space:·,tab:>·,trail:~,eol:¬
set noswapfile
set nowrap
set number
set previewheight=16
set relativenumber
set shiftwidth=4
set shortmess+=I
set showcmd
set softtabstop=4
set spelllang=en,ru
set statusline=%F\ %m%r%h%w%q%k%=%v\ %L
set tabstop=4
set timeout
set timeoutlen=1000
set ttimeoutlen=10
set undodir=$HOME/.vim/undodir
set undofile
set wildmenu

let &scrolloff=777
let g:mapleader="\<space>"
let g:netrw_altfile=1
let g:netrw_banner=0
let g:netrw_bufsettings="noma nomod nu nobl nowrap ro"

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap Y y$
vnoremap < <gv
vnoremap > >gv
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

inoremap <c-c> <c-[>
inoremap <c-@> <c-^>
inoremap <space> <c-g>u<space>
inoremap <cr> <c-g>u<cr>

nnoremap <c-f> :Explore<cr>
nnoremap <c-g> <c-^>
nnoremap <c-h> <c-w>h
nnoremap <c-j> :bprevious<cr>
nnoremap <c-k> :bnext<cr>
nnoremap <c-l> <c-w>l
nnoremap <c-x> :bdelete<cr>
nnoremap <c-@> :source $HOME/.vimrc<cr>

nnoremap <leader>w :w<cr>
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+y$
nnoremap <leader>o zo
vnoremap <leader>p "_dp
nnoremap <leader>s mz<bar>:%s/\s\+$//e<cr><bar>`z
vnoremap <leader>d "_d
nnoremap <leader>d "_d
nnoremap <leader>D "_d$
nnoremap <leader>c zc
nnoremap <leader><space> :x<cr>

syntax enable
filetype plugin on
colorscheme solarized

highlight spellbad cterm=underline
highlight statusline ctermbg=black ctermfg=darkgrey

autocmd bufwinleave *.* mkview
autocmd bufwinenter *.* silent loadview
