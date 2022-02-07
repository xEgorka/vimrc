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
let g:slime_python_ipython=1
let g:slime_target="tmux"

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

nnoremap <c-f> :Explore<cr>
nnoremap <c-g> <c-^>
nnoremap <c-h> <c-w>h
nnoremap <c-j> :bprevious<cr>
nnoremap <c-k> :bnext<cr>
nnoremap <c-l> <c-w>l

inoremap <c-@> <c-^>
inoremap <c-c> <c-[>
inoremap <c-d> <c-r>=toupper(strftime("%d/%m/%Y %a"))<cr><cr><cr>

nnoremap <leader>q :call Psql()<cr><cr>
nnoremap <leader>p :call IPython()<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>e :execute getline(line('.'))<cr>
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+y$
nnoremap <leader>i :h <c-r>=expand("<cword>")<cr><cr>
vnoremap <leader>p "_dp
nnoremap <leader>s mz<bar>:%s/\s\+$//e<cr><bar>`z
vnoremap <leader>d "_d
nnoremap <leader>d "_d
nnoremap <leader>D "_d$
nnoremap <leader>f mz<bar>:normal! 0i#<esc><bar>`z
nnoremap <leader>g mz<bar>:normal! 0x<esc><bar>`z
nnoremap <leader>v mzgqip`z
nnoremap <leader><leader> :x<cr>
nnoremap <leader><cr> :source $HOME/.vimrc<cr>

autocmd bufwinleave *.* mkview
autocmd bufwinenter *.* silent loadview

colorscheme solarized
syntax enable

highlight statusline ctermbg=none ctermfg=darkgrey
highlight spellbad cterm=underline

if exists('$TMUX')
    let &t_SI = "\<esc>Ptmux;\<esc>\<esc>]50;CursorShape=1\x7\<esc>\\"
    let &t_EI = "\<esc>Ptmux;\<esc>\e[2 q\<esc>\\"
else
    let &t_SI = "\<esc>]50;CursorShape=1\x7"
    let &t_EI = "\<esc>]50;CursorShape=0\x7"
endif

call plug#begin('$HOME/.vim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'tpope/vim-fugitive'
    Plug 'jpalardy/vim-slime', { 'for': 'python' }
call plug#end()

function! Psql() abort
    let s:f = search(';$','bnW') + 1
    let s:t = search(';$','cnW')
    let s:r = $TMP.'/'.strftime('%Y%m%d%H%M%S')
    execute s:f.','.s:t.'w !psql '.$CONNINFO.'&>'.s:r
    execute 'pedit '.s:r
endfunction

function! IPython() abort
    let s:f = search('^##','bnW') + 1
    let s:t = search('^##','cnW') - 1
    execute 'normal! '.s:f.'GV'.s:t.'G'
    call feedkeys("\<c-c>\<c-c>")
endfunction
