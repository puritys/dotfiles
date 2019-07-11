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
hi OptionSel cterm=NONE ctermfg=255 ctermbg=18 guifg=#eeeeee guibg=#045fa5
hi Option cterm=NONE ctermfg=240 ctermbg=253 guifg=#585858 guibg=#dadada
hi OptionHeavy cterm=NONE ctermfg=253 ctermbg=243 guifg=#dadada guibg=#767676

hi ErrorText cterm=NONE ctermfg=196 ctermbg=252 guifg=#ffffff guibg=#a93838
hi NoticeText cterm=NONE ctermfg=131 ctermbg=251 guifg=#af5f5f guibg=#c6c6c6
hi Unknown cterm=NONE ctermfg=255 ctermbg=232 guifg=#eeeeee guibg=#080808

" todo #f1066e link #0085c1
" /* axxxxxxxxx*/ // # 
hi Comment cterm=NONE ctermfg=28 ctermbg=NONE guifg=#056900 guibg=NONE
hi CommentKey cterm=NONE ctermfg=28 ctermbg=NONE guifg=#008700 guibg=NONE

" ---------
" Set theme
" ---------
hi TextMain cterm=NONE ctermfg=18 ctermbg=NONE guifg=#004e8a guibg=NONE
hi TextSub cterm=NONE ctermfg=232 ctermbg=NONE guifg=#080808 guibg=NONE
hi TextBold cterm=NONE ctermfg=166 ctermbg=NONE guifg=#c55700 guibg=NONE
hi TextEmphasize cterm=NONE ctermfg=88 ctermbg=NONE guifg=#870000 guibg=NONE
hi TextDesc      cterm=NONE ctermfg=23  ctermbg=NONE

hi TabLineFill cterm=NONE ctermfg=NONE ctermbg=240 guifg=NONE guibg=#585858
hi TabLine cterm=NONE ctermfg=247 ctermbg=240 guifg=#9e9e9e guibg=#585858
hi TabLineSel cterm=NONE ctermfg=16 ctermbg=230 guifg=#000000 guibg=#ffffd7
hi TabLineSelRightIcon cterm=NONE ctermfg=230 ctermbg=240 guifg=#ffffd7 guibg=#585858
hi TabLineRightIcon cterm=NONE ctermfg=240 ctermbg=230 guifg=#585858 guibg=#ffffd7

hi ExtraWhitespace cterm=NONE ctermfg=NONE ctermbg=252 guifg=NONE guibg=#d0d0d0

" if termguicolors is true and guibg is not NONE then the word selection in tmux will include the tail empty space of window.
"hi Normal cterm=NONE ctermfg=238 ctermbg=NONE guifg=#444444 guibg=#F1E7D0
hi Normal cterm=NONE ctermfg=238 ctermbg=NONE guifg=#444444 guibg=NONE

hi! link  TextType  TextMain

" Number line
hi LineNr cterm=NONE ctermfg=240 ctermbg=254 guifg=#585858 guibg=#e4e4e4

" The number line which cursor on it.
hi CursorLineNr cterm=NONE ctermfg=NONE ctermbg=252 guifg=NONE guibg=#d0d0d0
hi CursorLine cterm=NONE ctermfg=NONE ctermbg=252 guifg=NONE guibg=#d0d0d0
hi Cursor cterm=NONE ctermfg=NONE ctermbg=252 guifg=NONE guibg=#d0d0d0
hi iCursor cterm=NONE ctermfg=NONE ctermbg=252 guifg=NONE guibg=#d0d0d0
hi vCursor cterm=NONE ctermfg=NONE ctermbg=252 guifg=NONE guibg=#d0d0d0
hi lCursor cterm=NONE ctermfg=NONE ctermbg=252 guifg=NONE guibg=#d0d0d0

" Validation error
hi! link SpellBad ErrorText
" Validation Warning
hi! link SpellCap NoticeText

"  "xxxxxx" 
"hi Constant cterm=NONE  ctermfg=202  ctermbg=NONE
hi! link Constant TextBold

hi! link Exception ErrorText
hi! link IncSearch OptionSel
hi! link Search    OptionHeavy
hi! link ErrorMsg  ErrorText
hi! link WarningMsg  NoticeText

" -- INSERT -- 
hi ModeMsg cterm=NONE ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
hi MoreMsg cterm=NONE ctermfg=242 ctermbg=NONE guifg=#6c6c6c guibg=NONE

hi VertSplit cterm=reverse ctermfg=NONE ctermbg=240 guifg=NONE guibg=#585858

"hi WildMenu cterm=NONE  ctermfg=0   ctermbg=184 gui=NONE    guifg=#000000   guibg=#dfdf00

hi Folded cterm=NONE ctermfg=234 ctermbg=253 guifg=#1c1c1c guibg=#dadada
hi FoldColumn cterm=NONE ctermfg=248 ctermbg=58 guifg=#a8a8a8 guibg=#5f5f00
hi SignColumn cterm=NONE ctermfg=248 ctermbg=58 guifg=#a8a8a8 guibg=#5f5f00

" open  dir  text color
hi Directory cterm=NONE ctermfg=0 ctermbg=NONE guifg=#000000 guibg=NONE

"left Line number
"hi NonText  cterm=NONE  ctermfg=233 ctermbg=NONE

hi Title cterm=NONE ctermfg=0 ctermbg=184 guifg=#000000 guibg=#d7d700
hi Visual cterm=NONE ctermfg=255 ctermbg=244 guifg=#eeeeee guibg=#808080

" comment
hi! link SpecialComment Comment

" <CR> \"  \ xxx
hi! link Special TextBold

hi! link Todo NoticeText

" unknown
hi! link SpecialKey Unknown


" variable  $vb
hi! link Identifier  TextEmphasize

"c++ bool ...
hi! link Type TextType

"->
hi! link Function  TextType

" ( ) {}  
hi Delimiter cterm=NONE ctermfg=18 ctermbg=NONE guifg=#000087 guibg=NONE
hi Underlined cterm=underline ctermfg=39 ctermbg=NONE guifg=#00afff guibg=NONE

" Buffer Status Line
hi StatusLine cterm=NONE ctermfg=230 ctermbg=240 guifg=#F1E7D0 guibg=#585858
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
hi! link Tag             Comment
hi! link SpecialChar     Special
hi! link Delimiter       Special
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

hi! link htmlLink TextMain

" ---------------------
" c & cpp
" ---------------------
hi! link cParen TextMain
hi! link cppStatement Statement
hi! link cFormat         Statement
hi! link cType   TextType
hi! link cMultiGroup PreProc
hi! link cNumber  TextSub  
" + - * /
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

"" =========== java ============
" comment @param, @return 
hi! link javaDocTags Comment

" ===============
"  Plugin
" ===============

" indent guide
hi IndentGuidesOdd cterm=NONE ctermfg=NONE ctermbg=254 guifg=NONE guibg=#e4e4e4
hi IndentGuidesEven cterm=NONE ctermfg=NONE ctermbg=252 guifg=NONE guibg=#d0d0d0


" Valloric/MatchTagAlways
hi! link MatchTag OptionHeavy

