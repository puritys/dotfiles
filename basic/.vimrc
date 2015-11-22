syntax on
""/usr/share/vim/vim70/lang/

"set paste "" Can not put this line after the autoindent, of the  autoindent will be reset, "set paste" will disable hot key on insert mode.

set nocompatible
set hlsearch "high light search
set encoding=utf-8
set nu
set tabstop=4
"set softtabstop=4
set shiftwidth=4
set et

filetype plugin on
filetype plugin indent on


"自動縮排 cindent autoindent(ai)  smartindent
set cindent
set ai
set showcmd
set bg=dark
set backspace=2
set t_Co=256 "設定成256色
source $VIMRUNTIME/macros/matchit.vim
set foldmethod=marker
colorscheme mystyle_white
"" mystyle  molokai 

set cursorline

"use mouse
"set mouse=a
"出現水平線
"set cursorline

"最下下出現目前行數
set ruler

let mapleader=","

set encoding=utf-8
set fileencodings=utf-8,big5,cp936,latin1 "encoding
set termencoding=utf-8


source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<C-Z>


"tab setting
hi TabLine guifg=#2f2f2f guibg=#a050a0     ctermfg=248 ctermbg=233
hi TabLineSel guifg=#2f2f2f guibg=#a050a0     ctermfg=white ctermbg=69
"hi Comment term=bold ctermfg=darkcyan guifg=LightBlue
"熱鍵
map ,w :w<CR>
map ,q :wq<CR>
map ,e :mksession /home/puritys/~my_editFiles.vim<CR> "指定暫存些頁面 mks
map <Esc> :<C-c>
"Tab hotkeys
"nmap <C-t> :tabnew<CR>
"nmap <C-> :tabc<CR> "close tab
"數字鍵轉正常數字
map <Esc>Oq 1
map <Esc>Or 2
map <Esc>Os 3
map <Esc>Ot 4
map <Esc>Ou 5
map <Esc>Ov 6
map <Esc>Ow 7
map <Esc>Ox 8
map <Esc>Oy 9
map <Esc>Op 0
map <Esc>On .
map <Esc>OQ /
map <Esc>OR *
map <Esc>Ol +
map <Esc>OS -
map <Esc>[D 4
map <Esc>[C 6

" ctrl + s = save
map <C-s> :w<cr>

" Ctrl + c = copy
vmap <C-c> y

" Ctrl + v = paste
imap <C-v> <esc>P

" cut selected text (ctrl-x)
vmap <C-x> x

"切換tab
nmap 4 :tabp<CR>
nmap 6 :tabn<CR>

nmap n :tabp<CR>
nmap m :tabn<CR>
nmap gf <C-w>gf
map <F6> :emenu <C-Z>

" Fix for chrome 
nmap ,w <C-w>

" plugin
nmap ,tree :NERDTree<CR> " NERDTree plugin
nmap ,ctag :TlistToggle<CR> " taglist

" switch vim window
"<C-w>l right , <C-w>h left, <C-w>k up, <C-w>j down
"nmap <ESC>[1;5C <C-w>l " ctrl + right arrow : move to up split window
"nmap <ESC>[1;5D <C-w>h " ctrl + left arrow : 
nmap <ESC>[1;5A <C-w>h " ctrl + up arrow : move to up split window
nmap <ESC>[1;5B <C-w>l " ctrl + down arrow : move to up split window

nmap <Tab> <C-w>w " Clicking Tab  will  go to the next split window;
" putty
nmap <ESC>[A <C-w>h " ctrl + up arrow : move to up split window
nmap <ESC>[B <C-w>l " ctrl + down arrow : move to up split window


"vim tab
nmap <ESC>[1;2D :tabp<CR> " shift + left
nmap <ESC>[1;2C :tabn<CR> " shift + right

" putty
nmap <ESC>[D :tabp<CR>
nmap <ESC>[C :tabn<CR>


" Mac
map <ESC>[881 :tabp<CR> " shift + left , move to previous tab 
map <ESC>[882 :tabn<CR> " shift + right , move to next tab 

au BufRead,BufNewFile *.sjs set filetype=javascript
au BufRead,BufNewFile *.js set filetype=javascript
au BufRead,BufNewFile *.html set filetype=php
au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.java set filetype=java


:inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P> 
:inoremap <buffer> <C-S-Space> <C-X><C-U><C-P> 
:imap <tab> <c-x><c-o>


if has("autocmd") 
  autocmd Filetype java setlocal omnifunc=javacomplete#Complete
  autocmd Filetype php setlocal omnifunc=phpcomplete#CompletePHP
endif 


