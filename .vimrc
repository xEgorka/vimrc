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

nnoremap <c-f> :Ex<cr>
nnoremap <c-h> <c-w>h
nnoremap <c-j> :bp<cr>
nnoremap <c-k> :bn<cr>
nnoremap <c-l> <c-w>l
inoremap <c-c> <c-[>
nnoremap <c-@> i<c-^><esc>l
inoremap <c-@> <c-^>
inoremap <cr> <c-g>u<cr>
inoremap <space> <c-g>u<space>

nnoremap <bs><bs> <c-^>
nnoremap <cr><cr> :x<cr>
nnoremap <space><space> :up<cr>
nnoremap <space><cr> :source $MYVIMRC<cr>

nnoremap <space>w, yaw
nnoremap <space>w. yaW
nnoremap <space>e, yiw
nnoremap <space>e. yiW
nnoremap <space>y "+y
vnoremap <space>y "+y
nnoremap <space>Y "+y$
nnoremap <space>i i <esc>l
nnoremap <space>o mzo<esc>`z
nnoremap <space>O mzO<esc>`z
vnoremap <space>p "_dp
nnoremap <space>a a <esc>h
nnoremap <space>d "_d
vnoremap <space>d "_d
nnoremap <space>D "_d$
nnoremap <space>gg G
nnoremap <space>j zRzz
nnoremap <space>k zMzz
nnoremap <space>l ]szz
nnoremap <space>; :
nnoremap <space>v vg_
vnoremap <space>v $

nnoremap Q @q
nnoremap T mz^vg_"+y<esc>`z
nnoremap Y yg_
vnoremap Y y'>p
nnoremap H ^
nnoremap J mzJ`z
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
nnoremap L g_
nnoremap v <c-v>
nnoremap gV `[v`]
nnoremap n nzzzv
nnoremap N Nzzzv
vnoremap < <gv
vnoremap > >gv
nnoremap / mf/
nnoremap * mf*

onoremap p i(
onoremap b i[
onoremap q i"
onoremap <space>gg G

nnoremap \sp mz^Pa<space><esc>`z
nnoremap \dp mzj$v^ykA<space><esc>p`z
nnoremap \fp mzk$v^yjA<space><esc>p`z
nnoremap \gp mzA<space><esc>p`z
nnoremap \cp mzj$v^ykPa<space><esc>`z
nnoremap \vp mzk$v^yjPa<space><esc>`z

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
