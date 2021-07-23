" ============
" Set Default Value & function
" ============
function! DisableAle()
    let g:ale_lint_on_enter = 0
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_save = 0
    let g:ale_linters = {'java': []}
    let g:ale_completion_enabled = 0
   "" let g:ale_linters_explicit = 1
endfunction


let g:forceUseTab = 1
if !exists("g:enablePluginLightLine")
    let g:enablePluginLightLine = 0
endif
if !exists("g:enablePluginYouCompleteMe")
    let g:enablePluginYouCompleteMe = 0
endif
if !exists("g:enablePluginEclim")
    let g:enablePluginEclim = 0
endif
if !exists("g:enablePluginYouCompleteMeSyntax")
    let g:enablePluginYouCompleteMeSyntax = 0
endif
if !exists("g:enablePluginAle")
    let g:enablePluginAle = 1
endif
if !exists("g:enablePluginAleAutoComplete")
    let g:enablePluginAleAutoComplete = 0
endif
if !exists("g:enablePluginAirline")
    let g:enablePluginAirline = 0
endif
if !exists("g:enablePluginAleJavaagent")
    let g:enablePluginAleJavaagent = 0
endif


" vim log
"set verbosefile=/tmp/vim.log

" load fzf
set rtp+=~/.fzf

syntax on

set noswapfile
set nocompatible
set hlsearch "high light search
set encoding=utf-8
set nu
set tabstop=4 shiftwidth=4  softtabstop=0 expandtab
set nosmarttab
"set nois " quick search

set showcmd
set bg=dark
set backspace=2
set t_Co=256 "設定成256色
source $VIMRUNTIME/macros/matchit.vim
set foldmethod=marker
set tabpagemax=100


" vim version is smaller than 8 the cursorline performance is bad
if version > 800
    set cursorline
endif

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

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

if version > 800
    set completeopt=menuone,menu,noinsert,longest"
else
    set completeopt=menuone,menu"
endif

source ~/.vimrc_keymaps

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
    call PHP_KEYMAP()
    let b:ale_disable_lsp = 1
endfunction



au BufRead,BufNewFile *.sjs set filetype=javascript
au BufRead,BufNewFile *.js set filetype=javascript
au BufRead,BufNewFile *.html set filetype=html
au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.java set filetype=java
au BufRead,BufNewFile *.groovy set filetype=java
au BufRead,BufNewFile *.py set filetype=python
au BufRead,BufNewFile *.vim set filetype=vim
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

"":set dictionary="/usr/dict/words"


if has("autocmd")
" autocmd Filetype java setlocal omnifunc=javacomplete#Complete
"  autocmd Filetype php setlocal omnifunc=phpcomplete#CompletePHP
"  autocmd Filetype cpp setlocal omnifunc=omni#cpp#complete#Main
"  autocmd Filetype js  setlocal omnifunc=js#CompleteJS
"  autocmd Filetype javascript  setlocal omnifunc=js#CompleteJS
"  autocmd Filetype go setlocal omnifunc=gocomplete#Complete

  " whitespace
  autocmd BufRead,BufNew * match ExtraWhitespace /\t\+\| \s\+$/
    hi ExtraWhitespace cterm=NONE ctermfg=NONE ctermbg=252 guifg=NONE guibg=#d0d0d0
endif

if !empty(glob("~/.vimrc_customized"))
    source ~/.vimrc_customized
endif


source ~/.vimrc_plugins

" indent
set nocindent
set noautoindent
set nosmartindent
filetype indent off

if has("autocmd")
    au FileType php,phtml,java set cindent autoindent
    au FileType php,phtml filetype indent on
    au FileType cpp,c,cc  set cindent autoindent
    au BufRead,BufNewFile *.alias*,*.bash* setlocal ft=sh
endif





" disable paste bracket mode
" https://unix.stackexchange.com/questions/196098/copy-paste-in-xfce4-terminal-adds-0-and-1/196574#196574?newreg=50a3302c8f334958bfbe56d4f03cc548
set t_BE=
