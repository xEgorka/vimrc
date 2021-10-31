syntax on
se background=dark
colo solarized
let mapleader="\<space>"
" always show statusline
se ls=2
" custom statusline
se stl=%<%F%h%m%r%h%w%y\ %{&ff}\
se stl+=%{strftime(\"%d/%m/%Y\ %H:%M\")}%=\
se stl+=lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
hi StatusLine ctermbg=NONE ctermfg=darkgrey
se enc=utf-8
" tweak vimrc
com! Vimrc :vs $MYVIMRC
" ses how many lines of history to remember
se history=500
" turn on the Wild menu
se wmnu
" rerender at the end of the macro
se lz
" use host clipboard additionally
se clipboard=unnamed,unnamedplus
" display line numbers
se nu
se rnu
" toggle display line number
nm <silent> <leader>n :se nu!<cr>
" toggle between absolute -> relative line number
nn <c-n> :let [&nu, &rnu] = [&nu, &nu+&rnu==1]<cr>
" load without creating a swapfile
se noswapfile
" highlight search results
se hls
" no highlight search results
nn <silent> <leader>r :noh<return>
" ignore case in a pattern
se ignorecase
" unless the pattern contains at least one uppercase
se scs
" show where the pattern as it was typed
se is
" show (partial) command in the last line of the screen
se sc
" copy indent from current line when starting a new line
se ai
" use 4 spaces instead of tab
se ts=4 sts=4 sw=4 et
" no prompt a warning when leaving modified not saved file
se hid
" show the line and column number of the cursor position
se ru
" allow backspacing over everything in insert mode
se backspace=indent,eol,start
" name of a keyboard mapping
se kmp=russian-jcukenwin
" switch between keymaps
ino <c-l> <c-^>
se imi=0
se ims=0
" repeat the last macro used instead of stumbling into :ex
nn Q @@
" wrap/unwrap
nm <silent> <leader>f :se wrap!<cr>
" comment line with #
nm <silent> <leader>c 0i#<esc>
" write file
nm <leader>w :w!<cr>
" write file auto
nm <leader>a :se aw!<cr>
" format paragraph
nm <leader>v mzgqip`z
" open new window below using :sp
se sb
" open new window to the right using :vsp
se spr
se fo+=t
se lcs=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
" toggle visibility of listchars
nm <silent> <leader>l :se list!<cr>
" list of spellchecking languages
se spl=en,ru
" switch over spell checking
nm <silent> <leader>s :se spell!<cr>
" change red highlighting to underline
hi clear SpellBad
hi SpellBad cterm=underline
" insert datestamp
nn <F2> "=strftime("%d/%m/%Y %a")<cr>PgUU
" execute sql with https://github.com/yegorchi/vim-sql
nn <leader>g :call Psql()<cr><cr>
" keep cursor in the middle while scrolling down/up
let &scrolloff=999
nn <leader>zz :let &scrolloff=999-&scrolloff<cr>
" keep the cursor in place while joining lines
nn J mzJ`z
" Y behave like D
nn Y y$
" run the current line as if it were a command
nn <leader>e :exe getline(line('.'))<cr>
" strip trailing whitespaces
fu DeleteTrailingWS() abort
    norm mz
    %s/\v\s+$//ge
    norm `z
endf
nn <silent> <leader>ds :call DeleteTrailingWS()<cr>
" control window with control
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
" arrow keys resize windows
nn <left> :vert res -10<cr>
nn <right> :vert res +10<cr>
nn <up> :res -10<cr>
nn <down> :res +10<cr>

au BufWinLeave *.* mkview
au BufWinEnter *.* silent loadview
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
en
