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

set fillchars=

" ------
" define basic color
" -----
hi OptionSel cterm=none ctermfg=255 ctermbg=234 guifg=#eeeeee guibg=#1c1c1c
hi Option cterm=none ctermfg=240 ctermbg=253 guifg=#585858 guibg=#dadada
hi OptionHeavy cterm=none ctermfg=253 ctermbg=243 guifg=#dadada guibg=#767676

hi ErrorText cterm=none ctermfg=196 ctermbg=252 guifg=#ff0000 guibg=#d0d0d0
hi NoticeText cterm=none ctermfg=131 ctermbg=251 guifg=#af5f5f guibg=#c6c6c6
hi Unknown cterm=none ctermfg=255 ctermbg=232 guifg=#eeeeee guibg=#080808

" /* axxxxxxxxx*/ // # 
hi Comment cterm=none ctermfg=28 ctermbg=none guifg=#008700 guibg=none

" ---------
" Set theme
" ---------
hi TextMain cterm=none ctermfg=18 ctermbg=none guifg=#000087 guibg=none
hi TextSub cterm=none ctermfg=232 ctermbg=none guifg=#080808 guibg=none
hi TextBold cterm=none ctermfg=166 ctermbg=none guifg=#d75f00 guibg=none
hi TextEmphasize cterm=none ctermfg=88 ctermbg=none guifg=#870000 guibg=none
hi TextDesc      cterm=none ctermfg=23  ctermbg=none

hi TabLineFill cterm=none ctermfg=none ctermbg=240 guifg=none guibg=#585858
hi TabLine cterm=none ctermfg=247 ctermbg=240 guifg=#9e9e9e guibg=#585858
hi TabLineSel cterm=none ctermfg=16 ctermbg=230 guifg=#000000 guibg=#ffffd7
hi TabLineSelRightIcon cterm=none ctermfg=230 ctermbg=240 guifg=#ffffd7 guibg=#585858
hi TabLineRightIcon cterm=none ctermfg=240 ctermbg=230 guifg=#585858 guibg=#ffffd7

hi ExtraWhitespace cterm=none ctermfg=none ctermbg=252 guifg=none guibg=#d0d0d0

hi Normal cterm=none ctermfg=238 ctermbg=none guifg=#444444 guibg=none

hi! link  TextType  TextMain

" Number line
hi LineNr cterm=none ctermfg=240 ctermbg=254 guifg=#585858 guibg=#e4e4e4

" The number line which cursor on it.
hi CursorLineNr cterm=none ctermfg=none ctermbg=252 guifg=none guibg=#d0d0d0
hi CursorLine cterm=none ctermfg=none ctermbg=252 guifg=none guibg=#d0d0d0


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


"unknow
hi! link SpecialKey Unknown

" Buffer Status Line
hi StatusLine   cterm=none ctermfg=230 ctermbg=240
hi! link StatusLineNC TabLine
hi! link StatusLineTerm TabLineSel
hi! link StatusLineTermNC TabLine
hi! link VertSplit TabLine

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
hi! link phpOperator   TextDesc
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
hi! link phpStatement   phpKeyword
" if else switch
hi! link phpConditional phpKeyword
hi! link phpException   TextBold
" case
hi! link phpLabel phpKeyword
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

"" !===========javascript =========
hi! link javaScriptFunction TextMain
hi! link javaScriptBoolean TextBold
hi! link javaScriptNumber Constant
