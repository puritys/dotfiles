
if (exists("g:loaded_tabline_xx") && g:loaded_tabline_xx) || &cp
  finish
endif
let g:loaded_tabline_xx = 1

function! Tabline()
  let s = ''
  let tabCount = len(range(tabpagenr('$')))
  let currentPage = tabpagenr()
  let start = currentPage - 2
  let end   = currentPage + 2

  if start < 0
    let start = 0
  endif

  if end >= tabCount
    let end = tabCount - 1
  endif

  if end - start < 6
    let start = start - (6 - (end - start))
  endif

  if start < 0
    let start = 0
  endif


  for i in range(tabpagenr('$'))
    if i < start
        continue
    endif
    if i > end
        continue
    endif

    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")
    let bufname = (bufname != '' ? ' '. fnamemodify(bufname, ':t') . ' ' : '[No Name] ')
    let arrow = "\ue0b0"
    let arrowLight = "\ue0b1"

    if len(bufname) > 10
        "let bufname = system("echo 'aaa'")
        let nbufname = strpart(bufname, 0, 10) . '..'
        let nbufname .= strpart(bufname, len(bufname) - 4, 3)
        let bufname = nbufname
    endif

    if i + 1 == currentPage
      let s .= '%#TabLineSel# ' .tab . ':'
      let s .= bufname
      if bufmodified
        let s .= '[+] '
      endif

      if i + 1 != tabCount
          let s .=  '%#TabLineSelRightIcon#' . arrow
      endif

    else
      let s .= '%#TabLine# ' .tab.':'
      let s .= bufname
      if bufmodified
        let s .= '[+] '
      endif

      if i + 2 == currentPage
        let s .=  "%#TabLineRightIcon#".arrow
      elseif i+ 1 != tabCount
        let s .= arrowLight
      endif
    endif



  endfor
  let s .= '%#TabLineFill#'
  return s
endfunction

set tabline=%!Tabline()


