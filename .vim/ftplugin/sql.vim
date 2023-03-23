function! Execute_psql() abort
    let begin = search(';$','bnW') + 1
    let end = search(';$','cnW')
    let tmpfile = tempname()
    execute begin.','.end.'write !psql '.$CONNINFO.'&>'.tmpfile
    execute 'pedit '.tmpfile
endfunction

nnoremap <buffer> <Space>qq :call Execute_psql()<CR><CR>
nnoremap <buffer> <silent> <Space>f mz<bar>:normal! 0i-- <Esc><bar>`z
vnoremap <buffer> <silent> <Space>f mz<bar>:normal! 0i-- <Esc><bar>`z
nnoremap <buffer> <silent> <Space>gf mz<bar>:normal! 0xxx<Esc><bar>`z
vnoremap <buffer> <silent> <Space>gf mz<bar>:normal! 0xxx<Esc><bar>`z
