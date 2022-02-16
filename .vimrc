set autochdir
set autoindent
set background=dark
set backspace=indent,eol,start
set colorcolumn=80
set cursorline
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

nnoremap <c-f> :Explore<cr>
nnoremap <c-h> <c-w>h
nnoremap <c-j> :bp<cr>
nnoremap <c-k> :bn<cr>
nnoremap <c-l> <c-w>l
nnoremap <c-@> i<c-^><esc>l
inoremap <c-@> <c-^>
inoremap <space> <c-g>u<space>

nnoremap <bs><space> <c-^>
nnoremap <space><bs> <c-^>
nnoremap <space><cr> :source $MYVIMRC<cr>
nnoremap <cr><cr> :up<cr>
nnoremap <bs><bs> :x<cr>
nnoremap <space><space> :x<cr>

nnoremap <space>w, yaw
nnoremap <space>w. yaW
nnoremap <space>e, yiw
nnoremap <space>e. yiW
nnoremap <space>y "+y
vnoremap <space>y "+y
nnoremap <space>Y "+y$
nnoremap <space>i i <esc>l
nnoremap <space>o mmo<esc>`m
nnoremap <space>O mmO<esc>`m
vnoremap <space>p "_dp
nnoremap <space>a a <esc>h
nnoremap <space>d "_d
vnoremap <space>d "_d
nnoremap <space>D "_d$
nnoremap <space>gg G
nnoremap <space>gv `[v`]
nnoremap <space>h zg
nnoremap <space>j zRzz
nnoremap <space>k zMzz
nnoremap <space>l ]szz
nnoremap <space>; :
nnoremap <space>v vg_
nnoremap <space>/ q/

nnoremap Q @q
nnoremap T mm^vg_"+y<esc>`m
nnoremap Y y$
vnoremap y ygv=gv
vnoremap Y mmy'>P`mgv=gv
nnoremap F q:
nnoremap gJ mmgJ`m
nnoremap g<cr> <cr>
nnoremap H ^
nnoremap J mmJ`m
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
nnoremap L $
vnoremap L $
nnoremap v <c-v>
nnoremap n nzzzv
nnoremap N Nzzzv
vnoremap < <gv
vnoremap > >gv
nnoremap / mf/
nnoremap * mf*N

onoremap <space>gg G
onoremap p i(
onoremap b i[
onoremap q i"

nnoremap \sp mm^Pa<space><esc>`m
nnoremap \dp mmj$v^ykA<space><esc>p`m
nnoremap \fp mmk$v^yjA<space><esc>p`m
nnoremap \gp mmA<space><esc>p`m
nnoremap \cp mmj$v^ykPa<space><esc>`m
nnoremap \vp mmk$v^yjPa<space><esc>`m

syntax enable
filetype plugin on
colorscheme solarized

highlight spellbad cterm=underline
highlight statusline ctermbg=black ctermfg=darkgrey

augroup vimrc
    autocmd!
    autocmd bufwinleave *.* mkview
    autocmd bufwinenter *.* loadview
    autocmd BufWritePre * :call StripTrailingWhitespaces()
augroup END
