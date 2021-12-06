
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

if !has("termguicolors")
    echomsg "termguicolors is required"
else
    set termguicolors
endif

set fillchars=

let g:colors_name = "mystyle_white"

" ------
" Color Template
" -----
" fill up background
hi ThemeBG    guifg=NONE guibg=#F1E7D0
hi ThemeBGSel    guifg=NONE guibg=#d0c6ae
hi ThemeBGText1    guifg=#FFFFFF guibg=#78ad78
hi ThemeBGText2    guifg=#FFFFFF guibg=#b76855
hi ThemeBGText3      guifg=#FFFFFF guibg=#8378ad
hi ThemeBGText4     guifg=#FFFFFF guibg=#589cb1
hi ThemeBGText5    guifg=#585858 guibg=#dadada
hi ThemeBGText6    guifg=#dadada guibg=#767676
hi ThemeBGText7    guifg=#ffffff guibg=#004e8a
hi ThemeBGText8    guifg=NONE guibg=#d75f00
hi ThemeBGText9    guifg=#ffffff guibg=#00614b
hi ThemeBGText10    guifg=#ffffff guibg=#870000
hi ThemeBGText11    guifg=#ffffff guibg=#ffd7ff
hi ThemeBGText12    guifg=#ffffff guibg=#753d04

" font color
hi ThemeFG    guifg=#333333 guibg=NONE
hi ThemeFGSel    guifg=#222222 guibg=NONE
hi ThemeFGText1    guifg=#2b812b guibg=NONE
hi ThemeFGText2    guifg=#b76855 guibg=NONE
hi ThemeFGText3    guifg=#8378ad guibg=NONE
hi ThemeFGText4    guifg=#1d7895 guibg=NONE
hi ThemeFGText5    guifg=#0087d7 guibg=NONE
hi ThemeFGText6    guifg=#3a3a3a guibg=NONE
hi ThemeFGText7    guifg=#004e8a guibg=NONE
hi ThemeFGText8    guifg=#b75100 guibg=NONE
hi ThemeFGText9    guifg=#00614b guibg=NONE
hi ThemeFGText10    guifg=#870000 guibg=NONE
hi ThemeFGText11    guifg=#ffd7ff guibg=NONE
hi ThemeFGText12    guifg=#753d04 guibg=NONE

" ------
" define basic color
" -----
hi! link OptionSel ThemeBGText4
hi! link Option ThemeBGText5
hi! link OptionHeavy ThemeBGText6
hi! link ErrorText ThemeBGText2
hi! link NoticeText ThemeBGText3
hi! link Unknown ThemeBGText2

" /* axxxxxxxxx*/ // #
hi! link Comment ThemeFGText1
hi! link CommentKey ThemeFGText9

" ---------
" Theme
" ---------
hi! link TextKey ThemeFGText7
hi! link TextSub ThemeFGSel
hi! link TextBold ThemeFGText8
hi! link TextEmphasize ThemeFGText10
hi! link TextDesc ThemeFGText4
hi! link TextSelEmphasize ThemeFGText11

hi TabLineFill    guifg=NONE guibg=#585858
hi TabLine    guifg=#9e9e9e guibg=#585858
hi TabLineSel    guifg=#000000 guibg=#f1e7d0
"hi TabLineSelRightIcon    guifg=#f1e7d0 guibg=#585858
call RevertTablineArrow("TabLineSelRightIcon", "TabLineSel", "TabLine")
"hi TabLineRightIcon    guifg=#585858 guibg=#f1e7d0
call RevertTablineArrow("TabLineRightIcon", "TabLine", "TabLineSel")

hi ExtraWhitespace    guifg=NONE guibg=#d0d0d0

" if termguicolors is true and guibg is not NONE then the word selection in tmux will include the tail empty space of window.
hi Normal    guifg=#222222 guibg=#F1E7D0

hi! link  TextType  TextKey

" Number line
hi LineNr    guifg=#585858 guibg=#e4e4e4

" The number line which cursor on it.
hi! link CursorLineNr ThemeBGSel
hi! link CursorLine ThemeBGSel
hi Cursor    guifg=NONE guibg=#d0d0d0
hi iCursor    guifg=NONE guibg=#d0d0d0
hi vCursor    guifg=NONE guibg=#d0d0d0
hi lCursor    guifg=NONE guibg=#d0d0d0

" Validation error
hi! link SpellBad ErrorText
" Validation Warning
hi! link SpellCap NoticeText

"  "xxxxxx"
"hi Constant
hi! link Constant TextBold

hi! link Exception ErrorText
hi! link IncSearch OptionSel
hi! link Search    OptionHeavy
hi! link ErrorMsg  ErrorText
hi! link WarningMsg  NoticeText
hi! link ALEErrorSign  ErrorText
hi! link ALEWarningSign  NoticeText

" -- INSERT --
hi ModeMsg    guifg=NONE guibg=NONE
hi MoreMsg    guifg=#6c6c6c guibg=NONE

hi VertSplit    guifg=NONE guibg=#585858

"hi WildMenu       gui=NONE    guifg=#000000   guibg=#dfdf00

hi Folded    guifg=#1c1c1c guibg=#dadada
hi FoldColumn    guifg=#a8a8a8 guibg=#5f5f00
hi SignColumn    guifg=#a8a8a8 guibg=#5f5f00

" open  dir  text color
hi Directory    guifg=#000000 guibg=NONE

"left Line number
"hi NonText

hi Title    guifg=#000000 guibg=#d7d700
hi Visual    guifg=#eeeeee guibg=#808080

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
hi! link Delimiter Normal
"hi! link Underlined

" Buffer Status Line
hi StatusLine    guifg=#F1E7D0 guibg=#585858
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
hi! link Keyword         TextKey
hi! link SignColumn      PreProc
hi! link Tag             Comment
hi! link SpecialChar     Special
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
hi! link phpKeyword TextKey
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

hi! link htmlLink TextKey

" ---------------------
" c & cpp
" ---------------------
hi! link cParen TextKey
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
hi! link cCharacter TextKey
" !xx = \"style\"
hi! link cCppString Constant
hi! link cConstant Constant
" !<iostream>
hi! link cIncluded TextSub
" !#include
hi! link cInclude  TextKey
" !#define
hi! link cDefine TextKey
hi! link cPreCondit TextSub

"" !===========javascript =========
hi! link javaScriptFunction TextKey
hi! link javaScriptBoolean TextBold
hi! link javaScriptNumber Constant

"" =========== java ============
" comment @param, @return
hi! link javaDocTags Comment

" ===============
"  Plugin
" ===============

" indent guide
hi IndentGuidesOdd    guifg=NONE guibg=#e4e4e4
hi IndentGuidesEven    guifg=NONE guibg=#d0d0d0


" Valloric/MatchTagAlways
hi! link MatchTag OptionHeavy

" multiple cursor
hi link multiple_cursors_cursor OptionSel
hi link multiple_cursors_visual OptionHeavy

" coc
hi! link CocWarningSign ThemeFGText3
hi! link CocErrorSign   ThemeFGText10

let g:fzf_colors =
\ { 'fg':      ['fg', 'Option'],
  \ 'bg':      ['bg', 'Option'],
  \ 'hl':      ['fg', 'TextEmphasize'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'OptionSel'],
  \ 'bg+':     ['bg', 'OptionSel', 'CursorColumn'],
  \ 'hl+':     ['fg', 'TextSelEmphasize'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Normal'],
  \ 'pointer': ['fg', 'TextKey'],
  \ 'marker':  ['fg', 'TextSelEmphasize'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
