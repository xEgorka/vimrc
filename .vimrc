set autochdir
set autoindent
set backspace=indent,eol,start
set colorcolumn=80
set expandtab
set formatoptions+=t
set hidden
set history=10000
set iminsert=0
set imsearch=0
set incsearch
set keymap=russian-jcukenwin
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
let g:netrw_bufsettings='noma nomod nu nobl nowrap ro'

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap Y y$
vnoremap < <gv
vnoremap > >gv
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

inoremap <space> <c-g>u<space>
inoremap <cr> <c-g>u<cr>

nnoremap <c-f> <cmd>Explore<cr>
nnoremap <c-g> <c-^>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <cmd>bprevious<cr>
nnoremap <c-k> <cmd>bnext<cr>
nnoremap <c-l> <c-w>l

inoremap <c-l> <c-^>
inoremap <c-c> <c-[>
inoremap <c-d> <c-r>=toupper(strftime("%d/%m/%Y %a"))<cr>

nnoremap <leader>q <cmd>call Psql()<cr><cr>
nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>e <cmd>execute getline(line('.'))<cr>
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+y$
nnoremap <leader>i :h <c-r>=expand("<cword>")<cr><cr>
vnoremap <leader>p "_dp
nnoremap <leader>s <cmd>%s/\s\+$//e<cr>
vnoremap <leader>d "_d
nnoremap <leader>d "_d
nnoremap <leader>D "_d$
nnoremap <leader>f mz<bar>:normal! 0i#<esc><bar>`z
nnoremap <leader>v mzgqip`z
nnoremap <leader><leader> <cmd>x<cr>
nnoremap <leader><cr> <cmd>source $HOME/.vimrc<cr>

autocmd bufwinleave *.* mkview
autocmd bufwinenter *.* silent loadview

colorscheme solarized
syntax enable

highlight statusline ctermbg=none ctermfg=darkgrey
highlight spellbad cterm=underline

call plug#begin('$HOME/.vim/plugged')
  Plug 'vim-airline/vim-airline'
  Plug 'tpope/vim-fugitive'
  Plug 'jpalardy/vim-slime', { 'for': 'python' }
  Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
call plug#end()

function! Psql() abort
  let s:f = search(';$','bnW') + 1
  let s:t = search(';$','cnW')
  let s:r = $TMP.'/'.strftime('%Y%m%d%H%M%S')
  execute s:f.','.s:t.'w !psql '.$CONNINFO.'&>'.s:r
  execute 'pedit '.s:r
endfunction

if $TERM_PROGRAM =~ 'iTerm'
  let &t_SI = "\<esc>]50;CursorShape=1\x7"
  let &t_EI = "\<esc>]50;CursorShape=0\x7"
endif
if exists('$TMUX')
  let &t_SI = "\<esc>Ptmux;\<esc>\<esc>]50;CursorShape=1\x7\<esc>\\"
  let &t_EI = "\<esc>Ptmux;\<esc>\e[2 q\<esc>\\"
endif
