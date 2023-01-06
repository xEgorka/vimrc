function! Execute_sql() abort
    let s:f = search(';$','bnW') + 1
    let s:t = search(';$','cnW')
    let s:r = $TMP.'/'.strftime('%Y%m%d%H%M%S')
    execute s:f.','.s:t.'w !psql '.$CONNINFO.'&>'.s:r
    execute 'pedit '.s:r
endfunction
