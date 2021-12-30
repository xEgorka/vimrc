" highlight syntax and choose color scheme
sy on|se background=dark|colo solarized
" use space as leader
let mapleader=" "
" write current file
nn <leader>w :w<cr>
" write buffer if modified then hide
nn <leader><leader> :x<cr>
" leave insert mode
ino jk <esc>|ino <c-c> <esc>
" reload .vimrc
nn <leader><cr> :so ~/.vimrc<cr>
" show and configure statusline
se ls=2 stl=%F\ %m%r%h%w%q%k%=%v\ %L
hi statusline ctermbg=none ctermfg=darkgrey
" no delay after esc
se to tm=1010 ttm=10
" set the character encoding
se enc=utf-8
" cwd is one containing the file which was opened
se acd
" minimize update time for best experience
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
" no highlight search results
se nohls
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
" yank to host clipboard
nn <leader>y "+y|vn <leader>y "+y|nn <leader>Y mzgg"+yG`z
" no change unnamed register
vn <leader>p "_dp
nn <leader>d "_d|vn <leader>d "_d|nm <leader>D <leader>d$
" yank till the end of the line
nn Y y$
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
" toggle between the current and the alternate file
nn <leader>g <c-^>
" break undo sequence
ino <space> <c-g>u<space>|ino ) <c-g>u)|ino ( <c-g>u(
ino , <c-g>u,|ino . <c-g>u.|ino ! <c-g>u!|ino ? <c-g>u?
ino <cr> <c-g>u<cr>
" disable :ex
nn <silent> Q <nop>
" comment current line with #
nn <leader>c 0i# <esc>
" insert date and day of the week
ino <c-d> <c-r>=toupper(strftime("%d/%m/%Y %a"))<cr>
" format paragraph
nn <leader>v mzgqip`z
" underline bad words
hi spellbad cterm=underline
" move around windows using control+hjkl
nn <c-h> <c-w>h|nn <c-j> <c-w>j|nn <c-k> <c-w>k|nn <c-l> <c-w>l
" open a database toolkit and issue a query to the db
nn <leader>db :vs ~/.db/.sql<cr>|nn <leader>qq :cal Q()<cr><cr>
fu Q()
  let fr=search(';$','bnW')+1|let to=search(';$','cnW')
  let f='~/.db/'.strftime('%Y%m%d%H%M%S').'.sql'
  let c=':'.fr.','.to.'w !psql '.$CONNINFO.'&>'.f|exe c
  se sb|exe 'ped '.f.'|winc j|res 16|se nowrap|winc k'
endf
" resize current window height
nn <leader>- :res -8<cr>|nn <leader>+ :res +8<cr>
" hide adjacent window
nm <leader>h <c-w>w<leader><leader>
" open explorer
nn <leader>f :wincmd v<bar> :Ex<cr>
" indent and keep selected area
vn < <gv|vn > >gv
" move selected rows
vn J :m '>+1<cr>gv=gv|vn K :m '<-2<cr>gv=gv
ino <c-j> <esc>:m .+1<cr>==|ino <c-k> <esc>:m .-2<cr>==
nn <leader>j <esc>:m .+1<cr>==|nn <leader>k <esc>:m .-2<cr>==
" strip trailing whitespaces
nn <leader>n :%s/\s\+$//e<cr>
