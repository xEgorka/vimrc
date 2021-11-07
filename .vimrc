" enable syntax highlighting
sy on
" switch appearance mode
se background=dark
" choose color scheme
colo solarized
" use space as leader
let mapleader=" "
" write buffer
nm <leader>w :w<cr>
" write buffer if modified then hide
nn <silent> <leader><leader> :x<cr>
" leave insert mode
im ii <esc>
" edit .vimrc
nn <silent> <leader>v :vs ~/.vimrc<cr>
" autoreload upon save
au bufwritepost .vimrc so %
" show statusline
se ls=2
" configure statusline
se stl=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%d/%m/%Y\ %H:%M\")}%=
se stl+=column=%c%V\ line=%l\ lines:%L\ %P
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
se clipboard=unnamed,unnamedplus
" run the current line as if it were a command
nn <silent> <leader>e :exe getline(line('.'))<cr>
" keep cursor in the middle while scrolling
let &so=777
nn <silent> <leader>z :let &so=777+7-&so<cr>
" show line numbers
se nu
" display the line numbers relatively
se rnu
" toggle visibility of line numbers
nm <silent> <leader>n :se nu!<cr>
" toggle between absolute and relative line numbers
nn <c-n> :let [&nu, &rnu] = [&nu, &nu+&rnu==1]<cr>
" load without swapfile
se noswapfile
" highlight search results
se hls
" no highlight search results
nn <silent> <leader>r :noh<cr>
" ignore case in search pattern unless it contains uppercase
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
" no prompt warning when leaving modified but not saved buffer
se hid
" allow backspacing over everything in insert mode
se backspace=indent,eol,start
" set up keyboard mapping
se kmp=russian-jcukenwin
" switch between keymaps
ino <c-l> <c-^>
se imi=0
se ims=0
" repeat the macro
nn Q @@
" set strings to use in list mode
se lcs=space:·,tab:>·,trail:~,eol:¬
" enable automatic text wrapping
se fo+=t
" wrap or unwrap
nm <silent> <leader>f :se wrap!<cr>
" comment line with #
nm <silent> <leader>c 0i#<esc>
" insert date and day of week
nn <silent> <leader>d "=strftime("%d/%m/%Y %a")<cr>PgUU
" format paragraph
nm <leader>b mzgqip`z
" toggle visibility of list strings
nm <silent> <leader>l :se list!<cr>
" enable spellchecking for listed languages
se spl=en,ru
" switch over spell checking
nm <silent> <leader>s :se spell!<cr>
" underline bad words
hi spellbad cterm=underline
" keep the cursor in place while joining lines
nn J mzJ`z
" Y behave like D
nn Y y$
" open new window below using :sp
se sb
" open new window to the right using :vs
se spr
" move around windows using control+hjklx
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-x> <c-w>x
" resize window
nn <silent> <leader>k :res -7<cr>
nn <silent> <leader>j :res +7<cr>
" open sql toolkit
nn <leader>q :vs ~/.db/.sql<cr>
" issue a query to the database
nn <leader>g :cal Sql()<cr><cr>
fu Sql()
  let fr=search(';$','bnW')+1|let to=search(';$','cnW')
  let f='~/.db/'.strftime('%Y%m%d%H%M%S').'.sql'
  let c=':'.fr.','.to.'w !psql '.$CONNINFO.'&>'.f|exe c
  exe 'ped '.f.'|winc j|res 21|se nowrap|winc k'
endf
