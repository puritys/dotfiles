


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
" Color Template
" -----
" fill up background
hi ThemeBG cterm=NONE ctermfg=NONE ctermbg=NONE guifg=NONE guibg=#F1E7D0
hi ThemeBGSel cterm=NONE ctermfg=NONE ctermbg=180 guifg=NONE guibg=#d0c6ae
hi ThemeBGText1 cterm=NONE ctermfg=255 ctermbg=115 guifg=#FFFFFF guibg=#78ad78
hi ThemeBGText2 cterm=NONE ctermfg=255 ctermbg=160 guifg=#FFFFFF guibg=#b76855
hi ThemeBGText3 cterm=NONE ctermfg=255  ctermbg=93  guifg=#FFFFFF guibg=#8378ad
hi ThemeBGText4 cterm=NONE ctermfg=255 ctermbg=75  guifg=#FFFFFF guibg=#589cb1
hi ThemeBGText5 cterm=NONE ctermfg=240 ctermbg=253 guifg=#585858 guibg=#dadada
hi ThemeBGText6 cterm=NONE ctermfg=253 ctermbg=243 guifg=#dadada guibg=#767676
hi ThemeBGText7 cterm=NONE ctermfg=255 ctermbg=18 guifg=#ffffff guibg=#004e8a
hi ThemeBGText8 cterm=NONE ctermfg=255 ctermbg=28 guifg=#ffffff guibg=#056900
hi ThemeBGText9 cterm=NONE ctermfg=255 ctermbg=23 guifg=#ffffff guibg=#00614b
hi ThemeBGText10 cterm=NONE ctermfg=255 ctermbg=88 guifg=#ffffff guibg=#870000
hi ThemeBGText11 cterm=NONE ctermfg=255 ctermbg=225 guifg=#ffffff guibg=#ffd7ff
hi ThemeBGText12 cterm=NONE ctermfg=255 ctermbg=52 guifg=#ffffff guibg=#753d04

" font color
hi ThemeFG cterm=NONE ctermfg=234 ctermbg=NONE guifg=#333333 guibg=NONE
hi ThemeFGSel cterm=NONE ctermfg=233 ctermbg=NONE guifg=#222222 guibg=NONE
hi ThemeFGText1 cterm=NONE ctermfg=128 ctermbg=NONE guifg=#800da3 guibg=NONE
hi ThemeFGText2 cterm=NONE ctermfg=72 ctermbg=NONE guifg=#1d7b79 guibg=NONE
hi ThemeFGText3 cterm=NONE ctermfg=160 ctermbg=NONE guifg=#a32b0d guibg=NONE
hi ThemeFGText4 cterm=NONE ctermfg=166 ctermbg=NONE guifg=#d75f00 guibg=NONE
hi ThemeFGText5 cterm=NONE ctermfg=33 ctermbg=NONE guifg=#0087d7 guibg=NONE
hi ThemeFGText6 cterm=NONE ctermfg=237 ctermbg=NONE guifg=#3a3a3a guibg=NONE
hi ThemeFGText7 cterm=NONE ctermfg=18 ctermbg=NONE guifg=#004e8a guibg=NONE
hi ThemeFGText8 cterm=NONE ctermfg=28 ctermbg=NONE guifg=#056900 guibg=NONE
hi ThemeFGText9 cterm=NONE ctermfg=23 ctermbg=NONE guifg=#00614b guibg=NONE
hi ThemeFGText10 cterm=NONE ctermfg=88 ctermbg=NONE guifg=#870000 guibg=NONE
hi ThemeFGText11 cterm=NONE ctermfg=225 ctermbg=NONE guifg=#ffd7ff guibg=NONE
hi ThemeFGText12 cterm=NONE ctermfg=52 ctermbg=NONE guifg=#753d04 guibg=NONE

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
hi! link Comment ThemeFGText8
hi! link CommentKey ThemeFGText9

" ---------
" Theme
" ---------
hi! link TextKey ThemeFGText7
hi! link TextSub ThemeFGSel
hi! link TextBold ThemeFGText4
hi! link TextEmphasize ThemeFGText10
hi! link TextDesc ThemeFGText8
hi! link TextSelEmphasize ThemeFGText11

hi TabLineFill cterm=NONE ctermfg=NONE ctermbg=240 guifg=NONE guibg=#585858
hi TabLine cterm=NONE ctermfg=247 ctermbg=240 guifg=#9e9e9e guibg=#585858
hi TabLineSel cterm=NONE ctermfg=16 ctermbg=230 guifg=#000000 guibg=#f1e7d0
"hi TabLineSelRightIcon cterm=NONE ctermfg=230 ctermbg=240 guifg=#f1e7d0 guibg=#585858
call RevertTablineArrow("TabLineSelRightIcon", "TabLineSel", "TabLine")
"hi TabLineRightIcon cterm=NONE ctermfg=240 ctermbg=230 guifg=#585858 guibg=#f1e7d0
call RevertTablineArrow("TabLineRightIcon", "TabLine", "TabLineSel")

hi ExtraWhitespace cterm=NONE ctermfg=NONE ctermbg=252 guifg=NONE guibg=#d0d0d0

" if termguicolors is true and guibg is not NONE then the word selection in tmux will include the tail empty space of window.
hi Normal cterm=NONE ctermfg=238 ctermbg=223 guifg=#222222 guibg=#F1E7D0

hi! link  TextType  TextKey

" Number line
hi LineNr cterm=NONE ctermfg=240 ctermbg=254 guifg=#585858 guibg=#e4e4e4

" The number line which cursor on it.
hi! link CursorLineNr ThemeBGSel
hi! link CursorLine ThemeBGSel
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
hi! link ALEErrorSign  ErrorText
hi! link ALEWarningSign  NoticeText

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
hi! link Keyword         TextKey
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
hi IndentGuidesOdd cterm=NONE ctermfg=NONE ctermbg=254 guifg=NONE guibg=#e4e4e4
hi IndentGuidesEven cterm=NONE ctermfg=NONE ctermbg=252 guifg=NONE guibg=#d0d0d0


" Valloric/MatchTagAlways
hi! link MatchTag OptionHeavy

" multiple cursor
hi link multiple_cursors_cursor OptionSel
hi link multiple_cursors_visual OptionHeavy

" coc
hi! link CocWarningSign ThemeFGText1
hi! link CocErrorSign   ThemeFGText3

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
