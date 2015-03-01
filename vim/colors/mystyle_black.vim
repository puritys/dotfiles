" Vim color file



if &t_Co != 256 && ! has("gui_running")
echomsg ""
echomsg "err: please use GUI or a 256-color terminal (so that t_Co=256 could be set)"
echomsg ""
finish
endif

set background=dark
hi clear
if exists("syntax_on")
syntax reset
endif

" Which one is right?
let g:colors_name = "mystyle_black"



hi Normal       ctermfg=248 ctermbg=233 gui=none  guifg=#d0d0d0   guibg=#202020
hi LineNr   cterm=none  ctermfg=243 ctermbg=232 gui=none    guifg=#a8a8a8

hi IncSearch    cterm=none  ctermfg=0   ctermbg=223 gui=none    guifg=#000000   guibg=#ffdfaf


hi Search   cterm=none  ctermfg=23  ctermbg=87  gui=none    guifg=#000000   guibg=#afdf5f
hi ErrorMsg cterm=none  ctermfg=160 ctermbg=17  gui=bold    guifg=#ffffff   guibg=#df0000
hi WarningMsg   cterm=bold  ctermfg=196 ctermbg=bg  gui=bold    guifg=#ff0000   guibg=bg

hi ModeMsg  cterm=bold  ctermfg=fg  ctermbg=bg  gui=bold    guifg=fg    guibg=bg

hi MoreMsg  cterm=bold  ctermfg=250 ctermbg=bg  gui=bold    guifg=#bcbcbc   guibg=bg

hi StatusLine   cterm=bold  ctermfg=fg  ctermbg=239 gui=bold    guifg=fg    guibg=#4e4e4e
hi StatusLineNC cterm=none  ctermfg=fg  ctermbg=237 gui=none    guifg=fg    guibg=#3a3a3a
hi VertSplit    cterm=reverse   ctermfg=fg  ctermbg=237 gui=reverse guifg=fg    guibg=#3a3a3a

hi WildMenu cterm=bold  ctermfg=0   ctermbg=184 gui=bold    guifg=#000000   guibg=#dfdf00

hi Folded   cterm=none  ctermfg=250 ctermbg=234 gui=none    guifg=#eeeeee   guibg=#5f5f87
hi FoldColumn   cterm=none  ctermfg=248 ctermbg=58  gui=none    guifg=#a8a8a8   guibg=bg
hi SignColumn   cterm=none  ctermfg=248 ctermbg=bg  gui=none    guifg=#a8a8a8   guibg=bg

hi Directory    cterm=none  ctermfg=15  ctermbg=bg  gui=none    guifg=#00afff   guibg=bg

"left Line number
hi NonText  cterm=bold  ctermfg=248 ctermbg=bg  gui=bold    guifg=#a8a8a8   guibg=bg

hi SpecialKey   cterm=none  ctermfg=15  ctermbg=bg  gui=none    guifg=#5fdf5f   guibg=bg
hi Title    cterm=none  ctermfg=0   ctermbg=184 gui=none    guifg=#000000   guibg=#dfdf00
hi Visual   cterm=none  ctermfg=242 ctermbg=235 gui=none    guifg=#005f87   guibg=#afdfff

" /* axxxxxxxxx*/
hi Comment  cterm=none  ctermfg=40  ctermbg=bg  gui=none    guifg=#808080   guibg=bg

"  "xxxxxx" COLD
hi Constant cterm=none  ctermfg=255  ctermbg=236 gui=none guifg=#dfdfaf   guibg=bg
hi Error    cterm=none  ctermfg=196 ctermbg=45  gui=none    guifg=#ff0000   guibg=bg
""" WARM

" variable  $vb

hi Identifier   cterm=none  ctermfg=202 ctermbg=bg  gui=none    guifg=#afdf87   guibg=bg

" = ->   $aa->
hi Statement    cterm=none  ctermfg=45  ctermbg=bg  gui=none    guifg=#5fafdf   guibg=bg

hi Operator ctermfg=252  ctermbg=bg
hi Type     cterm=none  ctermfg=250 ctermbg=bg  gui=none    guifg=#afafdf   guibg=bg
"->
"hi keyword cterm=none  ctermfg=1   ctermbg=bg  gui=none    guifg=#5fafdf   guibg=bg
hi Function cterm=none  ctermfg=15  ctermbg=bg  gui=none    guifg=#5fafdf   guibg=bg
" ( ) {}  
hi Delimiter    cterm=none  ctermfg=94  ctermbg=bg  gui=none    guifg=#5fafdf   guibg=bg


hi  cFormat ctermfg=15  ctermbg=bg
hi Underlined   cterm=underline ctermfg=39  ctermbg=bg  gui=underline   guifg=#00afff   guibg=bg


hi link PreProc Statement
hi link phpMemberSelector Statement
hi link cppStatement Statement

hi link Keyword         Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link cType PreProc
hi link cCppBracket PreProc
hi link cMultiGroup PreProc
hi link SignColumn  PreProc
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Special
hi link SpecialComment  Special
hi link Debug           Special

