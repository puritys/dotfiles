let g:forceUseTab = 1

" vim log
"set verbosefile=/tmp/vim.log

" load fzf
set rtp+=~/.fzf

syntax on
""/usr/share/vim/vim70/lang/

"set paste" will disable all hot key on insert mode.

set noswapfile
set nocompatible
set hlsearch "high light search
set encoding=utf-8
set nu
set tabstop=4 shiftwidth=4  softtabstop=0 expandtab
set nosmarttab
filetype plugin on
"filetype plugin indent on
"filetype plugin indent off " this will break eclim validate

"set nois " quick search

set showcmd
set bg=dark
set backspace=2
set t_Co=256 "設定成256色
source $VIMRUNTIME/macros/matchit.vim
set foldmethod=marker
set tabpagemax=100

"tab setting
hi TabLine guifg=#2f2f2f guibg=#a050a0     ctermfg=248 ctermbg=233
hi TabLineSel guifg=#2f2f2f guibg=#a050a0     ctermfg=white ctermbg=69
colorscheme mystyle_white
"" mystyle  molokai

"出現水平線
set cursorline

"use mouse
"set mouse=a

"最下面出現目前行數
set ruler

let mapleader=","

set encoding=utf-8
set fileencodings=utf-8,big5,cp936,latin1 "encoding
set termencoding=utf-8


source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<C-Z>


" Hot key 
map <Esc> :<C-c>

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

"切換tab
if (exists("g:forceUseTab") && g:forceUseTab == 1)
    nmap 4 :tabp<CR>
    nmap 6 :tabn<CR>
    nmap n :tabp<CR>
    nmap m :tabn<CR>
    nmap <C-[>a :tabp<CR>
    nmap <C-[>s :tabn<CR>

    "vim tab
    nmap <ESC>[1;2D :tabp<CR> " shift + left
    nmap <ESC>[1;2C :tabn<CR> " shift + right

    " putty
    nmap <ESC>[D :tabp<CR>
    nmap <ESC>[C :tabn<CR>

    " Mac
    map <ESC>[881 :tabp<CR> " shift + left , move to previous tab 
    map <ESC>[882 :tabn<CR> " shift + right , move to next tab 
    let g:myTabe = "tabe"
else
    nmap 4 :bp<CR>
    nmap 6 :bn<CR>
    nmap n :bp<CR>
    nmap m :bn<CR>
    nmap <C-[>a :bp<CR>
    nmap <C-[>s :bn<CR>

    "vim tab
    nmap <ESC>[1;2D :bp<CR> " shift + left
    nmap <ESC>[1;2C :bn<CR> " shift + right

    " putty
    nmap <ESC>[D :bp<CR>
    nmap <ESC>[C :bn<CR>

    " Mac
    map <ESC>[881 :bp<CR> " shift + left , move to previous tab 
    map <ESC>[882 :bn<CR> " shift + right , move to next tab 
    let g:myTabe = "e"
endif

nmap gf <C-w>gf
map <F6> :emenu <C-Z>

" switch vim window
nmap <ESC>[1;5A <C-w>h " ctrl + up arrow : move to up split window
nmap <ESC>[1;5B <C-w>l " ctrl + down arrow : move to up split window

nmap <Tab> <C-w>w " Clicking Tab  will  go to the next split window;

" putty
nmap <ESC>[A <C-w>h " ctrl + up arrow : move to up split window
nmap <ESC>[B <C-w>l " ctrl + down arrow : move to up split window


" FZF
":map <C-p> :FZF<CR>
:nmap <C-p> :call fzf#run({
  \ 'sink':  g:myTabe,
  \ 'down': '40%',
  \ 'options': '--reverse --margin 5%,0%'
  \ })<CR>

:nmap <c-s> :w!<CR>
:imap <c-s> <Esc>:w!<CR>a
:nmap <c-q> :q<CR>
:imap <c-q> <Esc>:q<CR>a
:nmap :T :t
:nmap :W :w
:nmap :Q :q


" plugin hot key
nmap ,tree :NERDTree<CR> " NERDTree plugin
nmap ,ctag :TlistToggle<CR> " taglist

" tabular
map align :Tabularize /
map align, :Tab /,\zs

" TagBar
nmap <ESC>OQ ::TagbarToggle<CR>
nmap <F2>    :TagbarToggle<CR>
:set pastetoggle=<F3>

" SyntasticCheck
nmap sc :SyntasticCheck<CR>

" Copy/Paste : http://vim.wikia.com/wiki/Copy_and_paste_between_Vim_instances
vnoremap <silent> ,y y:new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/.vim_clipboard.txt<CR>
nnoremap <silent> ,y :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/.vim_clipboard.txt<CR>
map <silent> ,p :sview ~/.vim_clipboard.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>p
map <silent> ,P :sview ~/.vim_clipboard.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>P

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu"

function! INIT_CPP()
    set filetype=cpp
    " OmniCppComplete
    set tags+=~/.vim/tags/cpp
    "map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
    let OmniCpp_NamespaceSearch = 1
    let OmniCpp_GlobalScopeSearch = 1
    let OmniCpp_ShowAccess = 1
    let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
    let OmniCpp_MayCompleteDot = 1 " autocomplete after .
    let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
    let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
    let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
endfunction


function! INIT_PHP()
    set filetype=php
    set tags+=~/.vim/php_tags
    nmap doc :call PhpDocSingle()<CR>
endfunction

au BufRead,BufNewFile *.sjs set filetype=javascript
au BufRead,BufNewFile *.js set filetype=javascript
au BufRead,BufNewFile *.html set filetype=html
au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.java set filetype=java
au BufRead,BufNewFile *.cc  call INIT_CPP()
au BufRead,BufNewFile *.c   call INIT_CPP() 
au BufRead,BufNewFile *.cpp   call INIT_CPP() 
au BufRead,BufNewFile *.php call INIT_PHP()
au BufRead,BufNewFile *.phtml call INIT_PHP()
au BufRead,BufNewFile *.inc call INIT_PHP()

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '\(^\w\|>$\|:$\)'
    return "\<C-X>\<C-O>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <C-d> <C-R>=Tab_Or_Complete()<CR>
"":set dictionary="/usr/dict/words"


if has("autocmd")
  "autocmd Filetype java setlocal omnifunc=javacomplete#Complete
  autocmd Filetype php setlocal omnifunc=phpcomplete#CompletePHP
  autocmd Filetype cpp setlocal omnifunc=omni#cpp#complete#Main
  autocmd Filetype js  setlocal omnifunc=js#CompleteJS
  autocmd Filetype javascript  setlocal omnifunc=js#CompleteJS
  autocmd Filetype go setlocal omnifunc=gocomplete#Complete
  " whitespace
  autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
  autocmd BufRead,BufNew * match ExtraWhitespace /\t\+\| \s\+$/
endif


source ~/.vimrc_plugins

" indent
set nocindent
set noautoindent
set nosmartindent
au FileType cpp,c,cc,java,sh,pl,php,phtml,asp,xml,javascript  set nosmartindent nocindent noautoindent
filetype indent off
