set autoindent
set background=dark
set backspace+=eol
set backspace+=indent
set backspace+=start
set colorcolumn=80
set cursorline
set cursorcolumn
set errorformat^=%f:%l:%c\ %m
set expandtab
set formatoptions+=t
set grepprg=rg\ --vimgrep
set hidden
set history=100
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set incsearch
set laststatus=2
set lazyredraw
set listchars+=tab:>-
set listchars+=trail:~
set listchars+=nbsp:+
set nojoinspaces
set nomodeline
set noswapfile
set nowrap
set number
set path=$PWD
set previewheight=16
set relativenumber
set shiftwidth=4
set shortmess+=I
set showcmd
set softtabstop=4
set spelllang=en,ru
set splitbelow
set splitright
set statusline=%F\ %m%r%h%w%q%k%=%v\ %L
set tabstop=4
set timeout
set timeoutlen=1000
set ttimeoutlen=10
set undodir=$HOME/.vim/undodir
set undofile
set wildcharm=<C-z>
set wildmenu
"------------------------------------------------------------------------------
nnoremap <C-u> :call SmoothScroll('k')<CR>
nnoremap <C-d> :call SmoothScroll('j')<CR>
nnoremap <C-e> :Explore<CR>
nnoremap <C-y> :find **/*<C-z><S-Tab>
nnoremap <C-f> :call Fzf()<CR>
nnoremap <C-h> :cprevious<CR>
nnoremap <C-j> :bprevious<CR>
nnoremap <C-k> :bnext<CR>
nnoremap <C-l> :cnext<CR>
inoremap <C-@> <C-^>
nnoremap <C-@> i<C-^><Esc>l
nnoremap <Tab> <C-w>p

function! SmoothScroll(direction)
    let counter = 1
    while counter < &scroll
        execute "normal " . a:direction
        redraw
        sleep 2m
        let counter+=1
    endwhile
endfunction

function! Fzf()
    let tmpfile = tempname()
    execute 'silent !fzf --multi | awk ''{ print $1":1:0" }'' > '.tmpfile
    execute 'lfile '.tmpfile
    redraw!
endfunction
"------------------------------------------------------------------------------
nnoremap <Space> <Nop>
inoremap <Space> <C-g>u<Space>
nnoremap <Space><BS> <C-^>
nnoremap <Space><CR> :source $MYVIMRC<CR>
nnoremap <Space>!<CR> ^"xyg_:!<C-r>x<CR>
nnoremap <Space>@<CR> ^"xyg_@x
nnoremap <Space>:<CR> ^"xyg_:<C-r>x<CR>
nnoremap <Space>* :execute "Grep ".expand('<cword>')<CR>
nnoremap <Space>w :update<CR>
nnoremap <Space>y "+y
xnoremap <Space>y "+y
nnoremap <Space>Y "+y$
nnoremap <Space>o m`o<Esc>``
nnoremap <Space>O m`O<Esc>``
nnoremap <Space>a a <Esc>h
nnoremap <Space>s :call StripTrailingWhitespaces()<CR>
nnoremap <Space>d "_d
xnoremap <Space>d "_d
nnoremap <Space>x :exit<CR>

function! StripTrailingWhitespaces()
    let cur = getcurpos()
    %substitute/\s\+$//e
    call histdel("/", -1)
    call cursor(cur[1], cur[2])
endfunction

function! Grep(...)
	return system(join([&grepprg.' -i'] + [expandcmd(join(a:000, ' '))], ' '))
endfunction

command! -nargs=+ -complete=file_in_path -bar Grep cgetexpr Grep(<f-args>)

cnoreabbrev <expr> grep (getcmdtype() ==# ':' && getcmdline() ==# 'grep')
            \ ? 'Grep' : 'grep'

augroup quickfix
        autocmd!
        autocmd QuickFixCmdPost cgetexpr cwindow 15
        autocmd QuickFixCmdPost cgetexpr set norelativenumber
augroup END
"------------------------------------------------------------------------------
nnoremap * *N
nnoremap Y y$
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
cnoremap <expr> <Tab>   getcmdtype() =~ "[/?]" ? "<C-g>" : "<C-z>"
cnoremap <expr> <S-Tab> getcmdtype() =~ "[/?]" ? "<C-t>" : "<S-Tab>"

augroup highlightsearch
        autocmd!
        autocmd CmdlineEnter /,\? set hlsearch
        autocmd CmdlineLeave /,\? set nohlsearch
augroup END
"------------------------------------------------------------------------------
xnoremap i% GoggV
onoremap i% :<C-u>normal vi%<CR>
xnoremap il g_o^
onoremap il :<C-u>normal vil<CR>
xnoremap ik `]o`[
onoremap ik :<C-u>normal vik<CR>
xnoremap in :<C-u>call VisualNumber()<CR>
onoremap in :<C-u>normal vin<CR>
xnoremap ii :<C-u>call VisualIndentation()<CR>
onoremap ii :<C-u>normal vii<CR>

function! VisualNumber()
    call search('\d\([^0-9\.]\|$\)', 'cW')
    normal v
    call search('\(^\|[^0-9\.]\d\)', 'becW')
endfunction

function! VisualIndentation()
    normal! ^
    let indent = virtcol(getline('.') =~# '^\s*$' ? '$' : '.')
    let begin = search('^\(\s*\%'.indent.'v\|^$\)\@!', 'bWn') + 1
    let end = search('^\(\s*\%'.indent.'v\|^$\)\@!', 'Wn') - 1
    execute 'normal! '.begin.'G0'
    call search('^[^\n\r]', 'Wc')
    execute 'normal! Vo'.end.'G'
    call search('^[^\n\r]', 'bWc')
    normal! $o
endfunction
"------------------------------------------------------------------------------
function! SetCurrentWorkingDirectory()
    lcd %:p:h
    try
        lcd `=system('git rev-parse --show-toplevel')`
    catch
    endtry
endfunction

augroup vimrc
        autocmd!
        autocmd BufEnter *.* call SetCurrentWorkingDirectory()
        autocmd BufWinLeave *.* mkview
        autocmd BufWinEnter *.* loadview
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
