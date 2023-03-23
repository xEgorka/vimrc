let g:slime_target="tmux"
let g:slime_default_config={"socket_name": "default", "target_pane": "1"}
let g:slime_cell_delimiter="##"
let g:slime_python_ipython=1

nmap <Space>q <plug>SlimeSendCell
nnoremap <buffer> <silent> <Space>f m`<bar>:normal! 0i# <Esc><bar>``
vnoremap <buffer> <silent> <Space>f m`<bar>:normal! 0i# <Esc><bar>``
nnoremap <buffer> <silent> <Space>gf m`<bar>:normal! 0xx<Esc><bar>``
vnoremap <buffer> <silent> <Space>gf m`<bar>:normal! 0xx<Esc><bar>``
nnoremap <buffer> <silent> <Space>h :normal! o<Esc>2i#<Esc>77a-<Esc>k
nnoremap <buffer> <Space>r <Esc>:w<CR>:!clear;python %<CR>
