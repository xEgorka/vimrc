" switch appearance mode
se background=dark
" choose color scheme
colo solarized
" enable syntax highlighting
sy on
" use space as leader
let mapleader=" "
" write current file
nn <leader>w :w<cr>
" write buffer if modified then hide
nn <leader><leader> :x<cr>
" leave insert mode
nn ii <nop>
ino ii <esc>
" edit .vimrc
nn vi :vs ~/.vimrc<cr>
" autoreload .vimrc upon save
au bufwritepost .vimrc so %
" show statusline
se ls=2
" configure statusline
se stl=%F\ %m%r%h%w%q%k%=%v\ %L
hi statusline ctermbg=none ctermfg=darkgrey
" set the character encoding
se enc=utf-8
" make and load views
au bufwinleave *.* mkvie
au bufwinenter *.* silent lo
" strip trailing whitespaces
au filetype sql,python,yaml au bufwritepre <buffer> %s/\s\+$//e
" set number of command-lines to remember
se history=555
" turn on wild menu
se wmnu
" redraw at the end of the macro
se lz
" extra use host clipboard
se clipboard=unnamed
" run the current line as if it were a command
nn <silent> <leader>e :exe getline(line('.'))<cr>
" keep cursor in the middle while scrolling
let &so=777
nn <silent> <leader>zz :let &so=777+7-&so<cr><bar>:norm zz<cr>
" show line numbers
se nu
" display the line numbers relatively
se rnu
" toggle between absolute and relative line numbers
nn <silent> <c-n> :let [&nu,&rnu]=[&nu,&nu+&rnu==1]<cr>
" load without swapfile
se noswapfile
" highlight search results
se hls
" no highlight search results
nn <leader>r :noh<cr>
" ignore case in search unless pattern contains upper
se ignorecase
se scs
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
" set up keyboard mapping
se kmp=russian-jcukenwin
" break undo sequence by words
ino <space> <C-G>u<space>
" switch between keymaps
ino <c-l> <c-^>
se imi=0
se ims=0
" repeat the macro
nn Q @@
" define strings to use in list mode
se lcs=space:·,tab:>·,trail:~,eol:¬
" enable automatic text wrapping
se fo+=t
" toggle wrap
nn ff :se wrap!<cr>
" comment current line with #
nn <leader>c 0i# <esc>
" insert date and day of the week
ino <c-d> <c-r>=toupper(strftime("%d/%m/%Y %a"))<cr>
" format paragraph
nn <leader>v mzgqip`z
" toggle visibility of list strings
nn <leader>l :se list!<cr>
" enable spellchecking for listed languages
se spl=en,ru
" switch over spell checking
nn <leader>s :se spell!<cr>
" underline bad words
hi spellbad cterm=underline
" keep cursor in place while joining lines
nn J mzJ`z
" yank till the end of the line
nn Y y$
" open new window below using :sp
se sb
" open new window to the right using :vs
se spr
" move around windows using control+hjklx
nn <c-h> <c-w>h
nn <c-j> <c-w>j
nn <c-k> <c-w>k
nn <c-l> <c-w>l
nn <c-x> <c-w>x
" resize the window
nn <leader>k :res -16<cr>
nn <leader>j :res +16<cr>
" open a database toolkit
nn <leader>db :vs ~/.db/.sql<cr>
" issue a query to the db
nn <leader>q :cal Q()<cr><cr>
fu! Q()
  let fr=search(';$','bnW')+1|let to=search(';$','cnW')
  let f='~/.db/'.strftime('%Y%m%d%H%M%S').'.sql'
  let c=':'.fr.','.to.'w !psql '.$CONNINFO.'&>'.f|exe c
  exe 'ped '.f.'|winc j|res 16|se nowrap|winc k'
endf
