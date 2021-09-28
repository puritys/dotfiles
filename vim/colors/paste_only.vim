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

let g:colors_name = "paste_only"

hi Normal       ctermfg=248 ctermbg=233 gui=NONE  guifg=#008787   guibg=NONE
hi TabLineFill cterm=NONE ctermfg=NONE ctermbg=240 guifg=NONE guibg=#585858
hi TabLine cterm=NONE ctermfg=247 ctermbg=240 guifg=#9e9e9e guibg=#585858
hi TabLineSel cterm=NONE ctermfg=16 ctermbg=230 guifg=#000000 guibg=#f1e7d0
hi ErrorMsg cterm=none  ctermfg=160 ctermbg=17  gui=bold   guifg=#FFFFFF guibg=#b76855

hi!link Error    ErrorMsg
hi link LineNr  Normal
hi! link CursorLineNr Normal
hi! link CursorLine   Normal
hi! link Comment  Normal
hi! link Constant Normal
hi! link SpecialKey Normal
hi! link Identifier Normal
hi! link Type Normal
hi! link Function  Normal
hi! link Delimiter Normal
hi! link Underlined Normal
hi! link Statement Normal
hi! link Error     Normal
hi! link PreProc   Normal
hi! link Exception      Normal
hi! link Include        Normal
hi! link Define         Normal
hi! link Macro          Normal
hi! link PreCondit      Normal
hi! link StorageClass   Normal
hi! link Structure      Normal
hi! link Keyword        Normal
hi! link SignColumn     Normal
hi! link Tag            Normal
hi! link SpecialChar    Normal
hi! link Delimiter      Normal
hi! link Debug          Normal
hi! link Label          Normal
