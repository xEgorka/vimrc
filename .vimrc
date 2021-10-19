inoremap jk <esc>
let mapleader = " "
" tweake your vimrc
command! Vimrc :vs $MYVIMRC
syntax on
set background=dark
colorscheme solarized
" rerender at the end of the macro
set lazyredraw
" Display line numbers 
set number
" toggle display line number
nmap <silent> <leader>n :set number!<cr>
" toggle between absolute -> relative line number
nnoremap <c-n> :let [&nu, &rnu] = [&nu, &nu+&rnu==1]<cr>
set noswapfile
" highlight search results
set hlsearch
" no highlight search results
nnoremap <silent> <leader>r :noh<return>
set ignorecase
" ignore case in search patterns unless it contains at least one uppercase
set smartcase
set incsearch
set showcmd
" copy indent from current line when starting a new line
set autoindent
" use 4 spaces instead of tab (to replace existing tab use :retab)
set ts=4 sts=4 sw=4 expandtab
" doesn't prompt a warning when opening a file and the current file was modified but not saved
set hidden
set ruler
set backspace=indent,eol,start
set keymap=russian-jcukenwin
" switch between keymaps
inoremap <c-l> <c-^>
set iminsert=0
set imsearch=0
set enc=utf-8
" instead of stumbling into ex mode, repeat the last macro used
nnoremap Q @@
" wrap/unwrap
nmap <silent> <leader>f :set wrap!<cr>
" comment Python line
nmap <silent> <leader>c 0i#<esc>
" write file
nmap <leader>w :w!<cr>
nmap <leader>a :set autowrite!<cr>
" format paragraph
nmap <leader>v gqip
" make all horizontal splits open below the current one
set splitbelow
set formatoptions+=t
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
" toggle visibility of listchars
nmap <silent> <leader>l :set list!<cr>
" spellcheck
nmap <silent> <leader>s :set spell!<cr>
set spelllang=en,ru
" insert datestamp
nnoremap <F1> "=strftime("%d/%m/%Y %a")<cr>PgUU
" copy to host clipboard
noremap <F5> "+y
" execute sql with https://github.com/yegorchi/vim-sql
map <F8> :call Psql()<cr><cr>
" keep cursor more in middle when scrolling down / up
:nnoremap <leader>zz :let &scrolloff=999-&scrolloff<cr>
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
nnoremap <Left> :vertical resize -10<cr>
nnoremap <Right> :vertical resize +10<cr>
nnoremap <Up> :resize -10<cr>
nnoremap <Down> :resize +10<cr>

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
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

" custom statusline
set laststatus=2
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\
set statusline+=%{strftime(\"%d/%m/%Y\ %H:%M\")}%=\
set statusline+=lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
hi StatusLine ctermbg=NONE ctermfg=darkgrey
