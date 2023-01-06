# Vim-sql
Simple script allows to execute SQL statements using psql directly from vim.

## Installation
1. Copy psql.vim to ~/.vim/plugin/psql.vim and export postgres connection string to $CONNIFO
```
cp psql.vim ~/.vim/plugin/psql.vim
export CONNINFO='postgresql://user:password@netloc:port/dbname'
```
2. Create directory ~/.tmp
```
mkdir -p ~/.tmp
```

## Basic usage
1. Create file ~/.tmp/.sql and mark SQL statements with semicolons:
```
vi ~/.tmp/.sql
select 1;
select 2;
```
2. Put cursor to any line of the SQL statement and execute it:
```
:call Execute_sql()
```

## Tips
1. Map F8 to execute query with just a keystroke - add following to ~/.vimrc: 
```
map <f8> :call Execute_sql()<cr><cr>
```
2. Create alias to quickly access you favourite SQL statements - add following to ~/.zshrc: 
```
alias sql='vi ~/.tmp/.sql'
```
3. Get query timing in results - add following to ~/.psqlrc:
```
\timing
```
