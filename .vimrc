" use space as leader
let mapleader=" "
" remove banner from netrw
let g:netrw_banner=0
" highlight syntax and choose color scheme
sy on|se background=dark|colo solarized
" show and configure statusline
se ls=2 stl=%F\ %m%r%h%w%q%k%=%v\ %L
hi statusline ctermbg=none ctermfg=darkgrey
" underline bad words
hi spellbad cterm=underline
" automatically read file which changed outside
se ar
" no info on startup
se shm+=I
" no delay after esc
se to tm=1010 ttm=10
" set the character encoding
se enc=utf-8
" cwd is one containing the file which was opened
se acd
" minimize update time
se updatetime=55
" highlight line lenght limit
se colorcolumn=80
" show line numbers and display relatively
se nu rnu
" set number of command-lines to remember
se history=555
" turn on wild menu
se wmnu
" redraw at the end of the macro
se lz
" load without swapfile
se noswapfile
" show where the pattern as it was typed
se is
" show command in the last line of the screen
se sc
" keep indentation when starting a new line
se ai
" use 4 spaces instead of tab
se ts=4 sts=4 sw=4 et
" no prompt warning when leaving modified buffer
se hid
" allow backspacing over everything in insert mode
se backspace=indent,eol,start
" use RU keys mapping and switch to EN by default
se kmp=russian-jcukenwin imi=0 ims=0
" define strings to use in list mode
se lcs=space:·,tab:>·,trail:~,eol:¬
" enable automatic text wrapping
se fo+=t
" no wrap lines
se nowrap
" enable spellchecking
se spl=en,ru
" set height for a preview window
se pvh=16
" write current file
nn <leader>w :w<cr>
" write buffer if modified then hide
nn <leader><leader> :x<cr>
" reload .vimrc
nn <leader><cr> :so ~/.vimrc<cr>
" yank to host clipboard
nn <leader>y "+y|vn <leader>y "+y
" no change unnamed register
vn <leader>p "_dp|vn <leader>d "_d
nn <leader>d "_d|nm <leader>D <leader>d$
" yank till the end of the line
nn Y y$|nm <leader>Y <leader>y$
" run the current line as if it were a command
nn <silent> <leader>e :exe getline(line('.'))<cr>
" get help for the word under cursor
nn <leader>i :h <c-r>=expand("<cword>")<cr><cr>
" keep cursor in the middle while scrolling
let &so=777|nn <leader>zz :let &so=777+7-&so<cr><bar>:norm zz<cr>
" keep cursor centered
nn n nzzzv|nn N Nzzzv|nn J mzJ`z
" toggle between absolute and relative line numbers
nn <silent> <c-n> :let [&nu,&rnu]=[&nu,&nu+&rnu==1]<cr>
" leave insert mode
ino <c-c> <esc>
" break undo sequence
ino <space> <c-g>u<space>|ino ) <c-g>u)|ino ( <c-g>u(
ino , <c-g>u,|ino . <c-g>u.|ino ! <c-g>u!|ino ? <c-g>u?
ino <cr> <c-g>u<cr>
" insert date and day of the week
ino <c-g> <c-r>=toupper(strftime("%d/%m/%Y %a"))<cr>
" delete character after cursor
ino <c-d> <del>
" disable :ex
nn <silent> Q <nop>
" comment line with #
nn <leader>c 0i# <esc>
" format paragraph
nn <leader>v mzgqip`z
" go to left or right buffer split
nn <c-h> <c-w>h|nn <c-l> <c-w>l
" go to previous or next buffer
nn <c-j> :bp<cr>|nn <c-k> :bn<cr>
" browse files
nn <c-f> :Ex<cr>
" toggle alternate file
nn <c-g> <c-^>
" indent and keep selected area
vn < <gv|vn > >gv
" move visual selected lines
vn J :m '>+1<cr>gv=gv|vn K :m '<-2<cr>gv=gv
" strip trailing whitespaces
nn <leader>n :%s/\s\+$//e<cr>
" issue a sql query
nn <leader>qq :cal Q()<cr><cr>
fu Q()
  let f=search(';$','bnW')+1|let t=search(';$','cnW')
  let r=$TMP.'/'.strftime('%Y%m%d%H%M%S')
  exe f.','.t.'w !psql '.$CONNINFO.'&>'.r|exe 'ped '.r
endf
" show cursor as vertical bar in insert mode
if $TERM_PROGRAM =~ 'iTerm'
  let &t_SI = "\<esc>]50;CursorShape=1\x7"
  let &t_EI = "\<esc>]50;CursorShape=0\x7"
en
if exists('$TMUX')
  let &t_SI = "\<esc>Ptmux;\<esc>\<esc>]50;CursorShape=1\x7\<esc>\\"
  let &t_EI = "\<esc>Ptmux;\<esc>\e[2 q\<esc>\\"
en
