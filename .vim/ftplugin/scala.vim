let g:slime_target="tmux"
let g:slime_default_config={"socket_name": "default", "target_pane": "1"}
let g:slime_cell_delimiter="//--"
let g:slime_scala_ammonite=1

nmap <Space>q <plug>SlimeSendCell
nnoremap <buffer> <silent> <Space>f mz<bar>:normal! 0i// <Esc><bar>`z
vnoremap <buffer> <silent> <Space>f mz<bar>:normal! 0i// <Esc><bar>`z
nnoremap <buffer> <silent> <Space>gf mz<bar>:normal! 0xxx<Esc><bar>`z
vnoremap <buffer> <silent> <Space>gf mz<bar>:normal! 0xxx<Esc><bar>`z
nnoremap <buffer> <silent> <Space>h :normal! o<Esc>2i/<Esc>77a-<Esc>o<Esc>kk
