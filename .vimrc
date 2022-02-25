set autochdir
set autoindent
set background=dark
set backspace=indent,eol,start
set colorcolumn=80
set cursorline
set cursorcolumn
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

nnoremap <C-q> :bd<CR>
nnoremap <expr> <C-d> repeat("0j", &scroll)
nnoremap <expr> <C-u> repeat("0k", &scroll)
nnoremap <C-f> :Explore<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> :bp<CR>
nnoremap <C-k> :bn<CR>
nnoremap <C-l> <C-w>l
inoremap <C-@> <C-^>
nnoremap <C-@> i<C-^><Esc>l
nnoremap <Tab> <C-w>p
inoremap <Space> <C-g>u<Space>

nnoremap <BS><Space> <C-^>
nnoremap <Space><BS> <C-^>
nnoremap <Space><CR> :source $MYVIMRC<CR>
nnoremap <CR><CR> :up<CR>
nnoremap <BS><BS> :x<CR>
nnoremap <Space><Space> :x<CR>

nnoremap <Space>y "+y
xnoremap <Space>y "+y
nnoremap <Space>Y "+y$
nnoremap <Space>i i <Esc>l
nnoremap <Space>o m`o<Esc>``
nnoremap <Space>O m`O<Esc>``
xnoremap <Space>p "_dp
nnoremap <Space>a a <Esc>h
nnoremap <Space>d "_d
xnoremap <Space>d "_d
nnoremap <Space>D "_d$
nnoremap <Space>gg G
xnoremap <Space>gg G
onoremap <Space>gg G
nnoremap <Space>gv `[v`]
nnoremap <Space>j zRzz
nnoremap <Space>k zMzz
nnoremap <Space>; :
nnoremap <Space>c "_c
xnoremap <Space>c "_c
nnoremap <Space>C "_C
nnoremap <Space>v vg_
nnoremap <Space>, a,<Esc>
nnoremap <Space>/ q/

nnoremap Q :copen<CR>
nnoremap T @:
nnoremap Y y$
xnoremap Y m`y'>p``gv=gv
nnoremap F q:
nnoremap gJ m`gJ``
nnoremap g<CR> <CR>
nnoremap g/ :%s/
xnoremap g/ :s/
nnoremap H ^
nnoremap J m`J``
xnoremap J :m '>+1<CR>gv=gv
xnoremap K :m '<-2<CR>gv=gv
nnoremap L $
xnoremap L $
xnoremap v <C-v>
nnoremap n nzz
nnoremap N Nzz
xnoremap < <gv
xnoremap > >gv
nnoremap / mf/
nnoremap * mf*N

xnoremap il g_o^
onoremap il :<C-u>normal vil<CR>
xnoremap al $o0
onoremap al :<C-u>normal val<CR>

xnoremap i% :<C-u>let z = @/\|1;/^./kz<CR>G??<CR>:let @/ = z<CR>V'z
onoremap i% :<C-u>normal vi%<CR>
xnoremap a% GoggV
onoremap a% :<C-u>normal va%<CR>

augroup vimrc
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* loadview
    autocmd BufWritePre * :call StripTrailingWhitespaces()
augroup END

function! StripTrailingWhitespaces()
    normal! m`
    let s:search=@/
    %s/\s\+$//e
    let @/=s:search
    normal! ``
endfunction

syntax enable
filetype plugin on
colorscheme solarized

highlight spellbad cterm=underline
highlight statusline ctermbg=black ctermfg=darkgrey

let &scrolloff=777
let g:netrw_altfile=1
let g:netrw_banner=0
let g:netrw_bufsettings="noma nomod nu nobl nowrap ro"

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
