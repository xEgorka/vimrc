syntax on
set background=dark
colo solarized
let mapleader="\<space>"
" always show statusline
set ls=2
" custom statusline
set stl=%<%F%h%m%r%h%w%y\ %{&ff}\
set stl+=%{strftime(\"%d/%m/%Y\ %H:%M\")}%=\
set stl+=lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
hi StatusLine ctermbg=NONE ctermfg=darkgrey
set enc=utf-8
" tweak vimrc
command! Vimrc :vs $MYVIMRC
" rerender at the end of the macro
set lz
" use host clipboard additionally
set clipboard=unnamed,unnamedplus
" display line numbers
set nu
set rnu
" toggle display line number
nmap <silent> <leader>n :set nu!<cr>
" toggle between absolute -> relative line number
nnoremap <c-n> :let [&nu, &rnu] = [&nu, &nu+&rnu==1]<cr>
" load without creating a swapfile
set noswapfile
" highlight search results
set hls
" no highlight search results
nnoremap <silent> <leader>r :noh<return>
" ignore case in a pattern
set ignorecase
" unless the pattern contains at least one uppercase
set scs
" show where the pattern, as it was typed
set is
" show (partial) command in the last line of the screen
set sc
" copy indent from current line when starting a new line
set ai
" use 4 spaces instead of tab (to replace existing tab use :retab)
set ts=4 sts=4 sw=4 expandtab
" doesn't prompt a warning when opening a file and the current file was modified but not saved
set hid
" show the line and column number of the cursor position
set ru
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" name of a keyboard mapping
set kmp=russian-jcukenwin
" switch between keymaps
inoremap <c-l> <c-^>
set iminsert=0
set imsearch=0
" instead of stumbling into ex mode, repeat the last macro used
nnoremap Q @@
" wrap/unwrap
nmap <silent> <leader>f :set wrap!<cr>
" comment Python line
nmap <silent> <leader>c 0i#<esc>
" write file
nmap <leader>w :w!<cr>
" auto write file
nmap <leader>a :set aw!<cr>
" format paragraph
nmap <leader>v mzgqip`z
" make all horizontal splits open below the current one
set sb
" make all vertical splits open on right the current one
set spr
set fo+=t
set lcs=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
" toggle visibility of listchars
nmap <silent> <leader>l :set list!<cr>
" list of spellchecking languages
set spl=en,ru
" spell checking
nmap <silent> <leader>s :set spell!<cr>
" change red highlighting to underline
hi clear SpellBad
hi SpellBad cterm=underline
" insert datestamp
nnoremap <F2> "=strftime("%d/%m/%Y %a")<cr>PgUU
" execute sql with https://github.com/yegorchi/vim-sql
nnoremap <F8> :call Psql()<cr><cr>
" keep cursor more in middle when scrolling down / up
let &scrolloff=999
nnoremap <leader>zz :let &scrolloff=999-&scrolloff<cr>
" keep the cursor in place while joining lines
nnoremap J mzJ`z
" Y behave like D
nnoremap Y y$
" run the current line as if it were a command
nnoremap <leader>e :exe getline(line('.'))<cr>
" strip trailing whitespaces
function DeleteTrailingWS() abort
    normal mz
    %s/\v\s+$//ge
    normal `z
endfunc
nnoremap <silent> <leader>ds :call DeleteTrailingWS()<cr>
" control window with control
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
" arrow keys resize windows
nnoremap <left> :vertical resize -10<cr>
nnoremap <right> :vertical resize +10<cr>
nnoremap <up> :resize -10<cr>
nnoremap <down> :resize +10<cr>

au BufWinLeave *.* mkview
au BufWinEnter *.* silent loadview
" turn off relativenumber only for insert mode
augroup every
  autocmd!
  au InsertEnter * set norelativenumber
  au InsertLeave * set relativenumber
augroup END
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
