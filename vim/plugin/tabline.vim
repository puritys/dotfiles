
if (exists("g:loaded_tabline_xx") && g:loaded_tabline_xx) || &cp
  finish
endif
let g:loaded_tabline_xx = 1

function! Tabline()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")

    " set the tab page number (for mouse clicks)
    let s .= '%' . tab . 'T'
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
      if i > 0
          let s .= ' | '
      endif
    endif


    let s .= (bufname != '' ? ' '. fnamemodify(bufname, ':t') . ' ' : '[No Name] ')

    if bufmodified
      let s .= '[+] '
    endif

    if i + 2 == tabpagenr()
      let s .= ' | '
    endif

  endfor
  let s .= '%#TabLineFill#'
  return s
endfunction
set tabline=%!Tabline()

