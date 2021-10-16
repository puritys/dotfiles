set runtimepath^=~/.vim
let &packpath = &runtimepath
source ~/.vimrc

" auto dectect file changed and reload
set autoread
autocmd BufEnter,FocusGained,FocusLost,WinLeave,BufWinEnter * checktime
