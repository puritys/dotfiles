" Vim color file


if &t_Co != 256 && ! has("gui_running")
echomsg ""
echomsg "err: please use GUI or a 256-color terminal (so that t_Co=256 could be set)"
echomsg ""
finish
endif

set background=light
hi clear
if exists("syntax_on")
syntax reset
endif

let g:colors_name = "mystyle_white"

" ------
" define basic color
" -----
hi OptionSel  ctermfg=255 ctermbg=234
hi Option     ctermfg=240 ctermbg=253
hi OptionHeavy ctermfg=253 ctermbg=243

hi ErrorText  ctermfg=196 ctermbg=252
hi NoticeText ctermfg=131 ctermbg=251
hi TextType   ctermfg=18
hi Unknown    ctermfg=255 ctermbg=232

" ---------
" Set theme
" ---------
hi TextMain      ctermfg=18  ctermbg=none
hi TextSub       ctermfg=236 ctermbg=none
hi TextBold      ctermfg=160 ctermbg=none guifg=#d70000
hi TextEmphasize ctermfg=94  ctermbg=none guifg=#875f00
hi TextDesc      ctermfg=239  ctermbg=none

hi TabLineFill   ctermfg=black ctermbg=240
hi TabLine       ctermfg=247   ctermbg=240
hi TabLineSel    ctermfg=black ctermbg=230
hi TabLineSelRightIcon  ctermfg=230   ctermbg=240
hi TabLineRightIcon     ctermfg=240   ctermbg=230

hi Normal   ctermfg=238  ctermbg=none

" Number line
hi LineNr   cterm=none  ctermfg=240 ctermbg=254 
" The number line which cursor on it.
hi CursorLineNr cterm=none ctermfg=none ctermbg=252
hi CursorLine   cterm=none ctermfg=none ctermbg=252


"  "xxxxxx" 
"hi Constant cterm=none  ctermfg=202  ctermbg=none
hi! link Constant TextBold

hi! link Exception ErrorText
hi! link IncSearch OptionSel
hi! link Search    OptionHeavy
hi! link ErrorMsg  ErrorText
hi! link WarningMsg  NoticeText
hi ModeMsg  cterm=none  ctermfg=fg  ctermbg=none
hi MoreMsg  cterm=none  ctermfg=242 ctermbg=none

"hi StatusLine   cterm=none  ctermfg=fg  ctermbg=242 
"hi StatusLineNC cterm=none  ctermfg=fg  ctermbg=237 
hi VertSplit    cterm=reverse   ctermfg=fg  ctermbg=240

"hi WildMenu cterm=none  ctermfg=0   ctermbg=184 gui=none    guifg=#000000   guibg=#dfdf00

hi Folded   cterm=none  ctermfg=234 ctermbg=253
hi FoldColumn   cterm=none  ctermfg=248 ctermbg=58 
hi SignColumn   cterm=none  ctermfg=248 ctermbg=58 

" open  dir  text color
hi Directory    cterm=none  ctermfg=0  ctermbg=none 

"left Line number
"hi NonText  cterm=none  ctermfg=233 ctermbg=none

hi Title    cterm=none  ctermfg=0   ctermbg=184 
hi Visual   cterm=none  ctermfg=255 ctermbg=244 

" /* axxxxxxxxx*/
hi Comment  cterm=none  ctermfg=34  ctermbg=none


""" WARM

" variable  $vb
hi! link Identifier  TextEmphasize

"c++ bool ...
hi! link Type TextType

"->
hi! link Function  TextType

" ( ) {}  
hi Delimiter    cterm=none  ctermfg=18  ctermbg=none 
hi Underlined   cterm=underline ctermfg=39  ctermbg=none  

"hi cNumber ctermfg=18


"unknow
hi! link SpecialKey Unknown


"" Auto Complete
hi! link Pmenu     Option
hi! link PmenuSel  OptionSel

hi! link Statement TextType
hi! link Error     ErrorMsg
hi! link PreProc   Statement
hi! link Exception       Statement
hi! link Include         PreProc
hi! link Define          PreProc
hi! link Macro           PreProc
hi! link PreCondit       PreProc
hi! link StorageClass    TextType
hi! link Structure       TextType
hi! link Keyword         TextMain
hi! link SignColumn      PreProc
hi! link Tag             Special
hi! link SpecialChar     Special
hi! link Delimiter       Special
hi! link SpecialComment  Special
hi! link Debug           Special
hi! link Label           TextDesc
" ----------
" php 
" ----------
hi! link phpTodo       TextEmphasize 
hi! link phpIdentifier TextSub
hi! link phpOperator   TextBold
" function name    
hi! link phpRegion      TextDesc
hi! link phpVarSelector TextSub
" var const  method
hi! link phpKeyword TextMain
hi! link phpDefine  phpKeyword
" <<<
hi! link phpHereDoc    TextDesc
hi! link phpMethodsVar TextType
hi! link phpNowDoc     TextType
hi! link phpIdentifierComplex TextType
hi! link phpIdentifierSimply  TextType
hi! link phpStructure  TextType
" =
hi! link phpSpecialFunction phpKeyword
" >
hi! link phpFunctions       phpKeyword
" ->
hi! link phpMemberSelector  phpKwyword
" break return 
hi! link phpStatement   TextBold
" if else switch
hi! link phpConditional TextBold
hi! link phpException   TextBold
" case
hi! link phpLabel TextBold
" true false
hi! link phpBoolean TextBold
hi! link phpComparison TextBold
hi! link phpComment Comment
" float bool 
hi! link phpType TextType
" `cat /etc`
hi! link phpBacktick TextEmphasize
hi! link phpFoldHtmlInside Normal

" ---------------------
" c & cpp
" ---------------------
hi! link cParen TextMain
hi! link cppStatement Statement
hi! link cFormat         Statement
hi! link cType   TextType
hi! link cMultiGroup PreProc
hi! link cNumber  TextSub  
hi! link Operator TextSub
hi! link cOperator TextSub
hi! link cppOperator TextSub
hi! link cppCast TextSub
hi! link cCppBracket PreProc
hi! link cCharacter TextMain
" !xx = \"style\"
hi! link cCppString Constant
hi! link cConstant Constant
" !<iostream>
hi! link cIncluded TextSub
" !#include
hi! link cInclude  TextMain
" !#define
hi! link cDefine TextMain
hi! link cPreCondit TextSub

" !===========javascript =========
hi! link javaScriptFunction TextMain
hi! link javaScriptBoolean TextBold
hi! link javaScriptNumber Constant
