set autochdir
set autoindent
set background=dark
set backspace=indent,eol,start
set colorcolumn=80
set cursorline
set cursorcolumn
set expandtab
set formatoptions+=t
set grepprg=ag\ --vimgrep
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
set wildcharm=<C-z>
set wildmenu

nnoremap <C-u> :call SmoothScroll('k')<CR>
nnoremap <C-d> :call SmoothScroll('j')<CR>
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
nnoremap gQ :lopen<CR>
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
nnoremap n nzzzv
nnoremap N Nzzzv
xnoremap < <gv
xnoremap > >gv
nnoremap / mf/
nnoremap * mf*N

xnoremap il g_o^
onoremap il :<C-u>normal vil<CR>
xnoremap a% GoggV
onoremap a% :<C-u>normal va%<CR>
xnoremap ik `]o`[
onoremap ik :<C-u>normal vik<CR>
xnoremap in :<C-u>call VisualNumber()<CR>
onoremap in :<C-u>normal vin<CR>
xnoremap ir i[
onoremap ir :<C-u>execute 'normal v' . v:count1 . 'i['<CR>
xnoremap ar a[
onoremap ar :<C-u>execute 'normal v' . v:count1 . 'a['<CR>

cnoremap <expr> <Tab>   getcmdtype() =~ "[/?]" ? "<C-g>" : "<C-z>"
cnoremap <expr> <S-Tab> getcmdtype() =~ "[/?]" ? "<C-t>" : "<S-Tab>"

set errorformat^=%f:%l:%c\ %m
command! -bang -nargs=1 Global lgetexpr filter(
            \ map(getline(1,'$'), { key, val -> expand("%")
            \ . ":" . (key + 1) . ":1 " . (len(val) > 0 ? val : '  ') }),
            \ { idx, val -> expand('<bang>') == '!' ?
            \ val !~ '^.\{-}:1 \zs.*' . <q-args> . '.*' :
            \ val =~ '^.\{-}:1 \zs.*' . <q-args> . '.*' })

function! Grep(...)
	return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
endfunction

command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<f-args>)

cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'

augroup quickfix
	autocmd!
	autocmd QuickFixCmdPost cgetexpr cwindow
	autocmd QuickFixCmdPost lgetexpr lwindow
augroup END

function! SmoothScroll(direction)
        let counter = 1
        while counter < &scroll
                execute "normal " . a:direction
                redraw
                sleep 2m
                let counter+=1
        endwhile
endfunction

function! VisualNumber()
        call search('\d\([^0-9\.]\|$\)', 'cW')
        normal v
        call search('\(^\|[^0-9\.]\d\)', 'becW')
endfunction

function! StripTrailingWhitespaces()
        let cur = getcurpos()
        :%substitute/\s\+$//e
        call histdel("/", -1)
        call cursor(cur[1], cur[2])
endfunction

augroup vimrc
        autocmd!
        autocmd BufWinLeave *.* mkview
        autocmd BufWinEnter *.* loadview
        autocmd BufWritePre * :call StripTrailingWhitespaces()
        autocmd CmdlineEnter /,\? :set hlsearch
        autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

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
